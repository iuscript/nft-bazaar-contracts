// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC721Like {
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function awardItem(address player, string memory _tokenURI)
        external
        returns (uint256);
}

interface USDTLike {
    function transfer(address, uint256) external;

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external;
}

interface ERC20Like {
    function transfer(address, uint256) external returns (bool);

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool);
}

interface MarketLike {
    function royalty(uint256 tokenID) external returns (address);
}

contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }

    function acceptOwnership() public {
        require(msg.sender == newOwner, "you are not the owner");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

contract NftMarket is Owned {
    address public nftAsset;
    address public usdToken;
    address public previous_version;
    string public constant version = "2.7.1";
    uint256 public transferFee = 25;
    uint256 public authorShare = 20;
    uint256 public sellerShare = 500;
    uint256 public bidderShare = 300;
    uint256 public bidGrowth = 100;

    struct Offer {
        bool isForSale;
        bool isBid;
        uint256 tokenID;
        address seller;
        uint256 price;
        address paymentToken;
        uint256 startTime;
        uint256 endTime;
    }

    struct Bid {
        uint256 tokenID;
        address bidder;
        uint256 value;
    }

    mapping(uint256 => address) public royalty;
    mapping(uint256 => Offer) public nftOffered;
    mapping(uint256 => Bid) public currentBid;

    event Offered(
        uint256 indexed tokenID,
        address indexed seller,
        uint256 price,
        address paymentToken,
        bool isBid,
        uint256 startTime,
        uint256 endTime
    );
    event Bought(
        address indexed seller,
        address indexed buyers,
        uint256 indexed tokenID,
        uint256 price,
        address paymentToken
    );
    event NoLongerForSale(uint256 indexed tokenID);
    event BidEntered(
        uint256 indexed tokenID,
        address indexed fromAddress,
        uint256 value
    );
    event AuctionPass(uint256 indexed tokenID);
    event ChangePrice(
        uint256 indexed tokenID,
        uint256 price,
        address paymentToken
    );

    bool private _mutex;
    modifier _lock_() {
        require(!_mutex, "reentry");
        _mutex = true;
        _;
        _mutex = false;
    }

    constructor(
        address _nftAsset,
        address _usdToken,
        address _previous_version
    ) {
        nftAsset = _nftAsset;
        usdToken = _usdToken;
        previous_version = _previous_version;
    }

    function createAndSell(
        string memory _tokenURI,
        uint256 _price,
        address _paymentToken,
        bool _isBid,
        uint256 _startTime,
        uint256 _endTime
    ) external returns (uint256) {
        uint256 tokenID = ERC721Like(nftAsset).awardItem(
            address(this),
            _tokenURI
        );

        royalty[tokenID] = msg.sender;

        _sell(tokenID, _price, _paymentToken, _isBid, _startTime, _endTime);

        return tokenID;
    }

    function sell(
        uint256 _tokenID,
        uint256 _price,
        address _paymentToken,
        bool _isBid,
        uint256 _startTime,
        uint256 _endTime
    ) external {
        if (royalty[_tokenID] == address(0)) {
            address temp = MarketLike(previous_version).royalty(_tokenID);
            if (temp != address(0)) {
                royalty[_tokenID] = temp;
            } else {
                royalty[_tokenID] = msg.sender;
            }
        }

        ERC721Like(nftAsset).transferFrom(msg.sender, address(this), _tokenID);

        _sell(_tokenID, _price, _paymentToken, _isBid, _startTime, _endTime);
    }

    function _sell(
        uint256 _tokenID,
        uint256 _price,
        address _paymentToken,
        bool _isBid,
        uint256 _startTime,
        uint256 _endTime
    ) internal {
        uint256 startTime = _startTime;
        if (_endTime != 0) {
            require(
                _endTime > block.timestamp + 10 minutes,
                "Bidding period is 10 minutes minimum"
            );
            require(
                _endTime < block.timestamp + 12 weeks,
                "The longest bidding time is within 12 weeks"
            );
            require(
                _startTime < _endTime,
                "The start time cannot be less than the end time"
            );
        }
        if (_startTime < block.timestamp) {
            startTime = block.timestamp;
        }

        if (_isBid) {
            require(_price > 0, "price > 0");
        }

        nftOffered[_tokenID] = Offer(
            true,
            _isBid,
            _tokenID,
            msg.sender,
            _price,
            _paymentToken,
            startTime,
            _endTime
        );

        emit Offered(
            _tokenID,
            msg.sender,
            _price,
            _paymentToken,
            _isBid,
            startTime,
            _endTime
        );
    }

    function noLongerForSale(uint256 tokenID) external {
        Offer memory offer = nftOffered[tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(msg.sender == offer.seller, "Only the seller can operate");
        require(!offer.isBid, "The auction cannot be cancelled");

        ERC721Like(nftAsset).transferFrom(address(this), offer.seller, tokenID);
        delete nftOffered[tokenID];
        emit NoLongerForSale(tokenID);
    }

    function changePrice(
        uint256 tokenID,
        uint256 price,
        address paymentToken
    ) external {
        Offer memory offer = nftOffered[tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(msg.sender == offer.seller, "Only the seller can operate");
        require(!offer.isBid, "The auction cannot be cancelled");

        offer.price = price;
        offer.paymentToken = paymentToken;

        nftOffered[tokenID] = offer;
        emit ChangePrice(tokenID, price, paymentToken);
    }

    function buy(uint256 _tokenID) external payable _lock_ {
        Offer memory offer = nftOffered[_tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(!offer.isBid, "nft is auction mode");
        require(
            block.timestamp > offer.startTime,
            "The auction hasn't started yet"
        );
        uint256 share1 = (offer.price * transferFee) / 1000;

        if (offer.paymentToken == address(0)) {
            require(
                msg.value >= offer.price,
                "Sorry, your credit is running low"
            );
            payable(offer.seller).transfer(offer.price - share1);
            payable(royalty[_tokenID]).transfer((share1 * authorShare) / 1000);
        } else if (offer.paymentToken == usdToken) {
            USDTLike(offer.paymentToken).transferFrom(
                msg.sender,
                address(this),
                offer.price
            );
            USDTLike(offer.paymentToken).transfer(
                offer.seller,
                offer.price - share1
            );
            USDTLike(offer.paymentToken).transfer(
                royalty[_tokenID],
                (share1 * authorShare) / 1000
            );
        } else {
            ERC20Like(offer.paymentToken).transferFrom(
                msg.sender,
                address(this),
                offer.price
            );
            ERC20Like(offer.paymentToken).transfer(
                offer.seller,
                offer.price - share1
            );
            ERC20Like(offer.paymentToken).transfer(
                royalty[_tokenID],
                (share1 * authorShare) / 1000
            );
        }

        ERC721Like(nftAsset).transferFrom(address(this), msg.sender, _tokenID);
        emit Bought(
            offer.seller,
            msg.sender,
            _tokenID,
            offer.price,
            offer.paymentToken
        );
        delete nftOffered[_tokenID];
    }

    function enterBid(uint256 tokenID, uint256 amount) external payable _lock_ {
        Offer memory offer = nftOffered[tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(offer.isBid, "nft must beauction mode");
        require(
            offer.seller != msg.sender,
            "The seller cannot participate in the auction"
        );
        if (offer.endTime > 0) {
            require(block.timestamp < offer.endTime, "The auction is over");
        }
        require(
            block.timestamp > offer.startTime,
            "The auction hasn't started yet"
        );

        Bid memory bid = currentBid[tokenID];

        if (offer.paymentToken == usdToken) {
            if (bid.bidder == address(0)) {
                require(
                    amount >= offer.price,
                    "The bid cannot be lower than the starting price"
                );
            } else {
                if (bid.value < 1350 * 1e6 + offer.price) {
                    require(
                        amount >= 150 * 1e6 + bid.value,
                        "The price increase was lower than expected"
                    );
                } else {
                    require(
                        amount >= (bid.value * (bidGrowth + 1000)) / 1000,
                        "The price increase was lower than expected"
                    );
                }
            }

            USDTLike(offer.paymentToken).transferFrom(
                msg.sender,
                address(this),
                amount
            );

            if (bid.bidder != address(0)) {
                USDTLike(offer.paymentToken).transfer(bid.bidder, bid.value);
                USDTLike(offer.paymentToken).transfer(
                    bid.bidder,
                    ((amount - bid.value) * bidderShare) / 1000
                );
            }

            currentBid[tokenID] = Bid(tokenID, msg.sender, amount);
            emit BidEntered(tokenID, msg.sender, amount);
        } else if (offer.paymentToken == address(0)) {
            require(
                amount == msg.value,
                "The ETH value should be equal to the amount value"
            );
            if (bid.bidder == address(0)) {
                require(
                    msg.value >= offer.price,
                    "The bid cannot be lower than the starting price"
                );
            } else {
                if (bid.value < 45 * 1e16 + offer.price) {
                    require(
                        msg.value >= 5 * 1e16 + bid.value,
                        "The price increase was lower than expected"
                    );
                } else {
                    require(
                        msg.value > (bid.value * (bidGrowth + 1000)) / 1000,
                        "The price increase was lower than expected"
                    );
                }
            }

            if (bid.bidder != address(0)) {
                payable(bid.bidder).transfer(bid.value);
                payable(bid.bidder).transfer(
                    ((msg.value - bid.value) * bidderShare) / 1000
                );
            }

            currentBid[tokenID] = Bid(tokenID, msg.sender, msg.value);
            emit BidEntered(tokenID, msg.sender, msg.value);
        } else {
            if (bid.bidder == address(0)) {
                require(
                    amount >= offer.price,
                    "The bid cannot be lower than the starting price"
                );
            } else {
                if (bid.value < 1350 * 1e6 + offer.price) {
                    require(
                        amount >= 150 * 1e6 + bid.value,
                        "The price increase was lower than expected"
                    );
                } else {
                    require(
                        amount >= (bid.value * (bidGrowth + 1000)) / 1000,
                        "The price increase was lower than expected"
                    );
                }
            }

            ERC20Like(offer.paymentToken).transferFrom(
                msg.sender,
                address(this),
                amount
            );

            if (bid.bidder != address(0)) {
                ERC20Like(offer.paymentToken).transfer(bid.bidder, bid.value);
                ERC20Like(offer.paymentToken).transfer(
                    bid.bidder,
                    ((amount - bid.value) * bidderShare) / 1000
                );
            }

            currentBid[tokenID] = Bid(tokenID, msg.sender, amount);
            emit BidEntered(tokenID, msg.sender, amount);
        }
    }

    function deal(uint256 tokenID) external _lock_ {
        Offer memory offer = nftOffered[tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(offer.isBid, "must be auction mode");
        require(offer.endTime != 0, "Open ended auction");
        require(offer.endTime < block.timestamp, "The auction is not over yet");

        Bid memory bid = currentBid[tokenID];

        if (bid.bidder != address(0)) {
            uint256 seller_share0 = ((bid.value - offer.price) * sellerShare) /
                1000 +
                offer.price; //溢出的50% + 起拍价
            uint256 seller_share = (seller_share0 * (1000 - transferFee)) /
                1000; // 卖家实际分润（扣除了平台的2.5%）

            uint256 contractFee = 1000 - sellerShare - bidderShare;
            uint256 contract_share = ((bid.value - offer.price) * contractFee) /
                1000 +
                (seller_share0 * transferFee) /
                1000; // 平台分润 = 溢出的20% + 从卖家收取的服务费2.5%

            uint256 share_Author = (contract_share * authorShare) / 1000; // 作者的分润 = 平台分润 * 2%

            if (offer.paymentToken == usdToken) {
                USDTLike(offer.paymentToken).transfer(
                    royalty[tokenID],
                    share_Author
                );
                USDTLike(offer.paymentToken).transfer(
                    offer.seller,
                    seller_share
                );
            } else if (offer.paymentToken == address(0)) {
                payable(royalty[tokenID]).transfer(share_Author);
                payable(offer.seller).transfer(seller_share);
            } else {
                ERC20Like(offer.paymentToken).transfer(
                    royalty[tokenID],
                    share_Author
                );
                ERC20Like(offer.paymentToken).transfer(
                    offer.seller,
                    seller_share
                );
            }

            ERC721Like(nftAsset).transferFrom(
                address(this),
                bid.bidder,
                tokenID
            );
            emit Bought(
                offer.seller,
                bid.bidder,
                tokenID,
                bid.value,
                offer.paymentToken
            );
        } else {
            ERC721Like(nftAsset).transferFrom(
                address(this),
                offer.seller,
                tokenID
            );
            emit AuctionPass(tokenID);
        }
        delete nftOffered[tokenID];
        delete currentBid[tokenID];
    }

    function reSelling(
        uint256 _tokenID,
        uint256 _price,
        address _paymentToken,
        bool _isBid,
        uint256 _startTime,
        uint256 _endTime
    ) external _lock_ {
        Offer memory offer = nftOffered[_tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(offer.isBid, "Must be auction mode");
        require(offer.endTime != 0, "Open ended auction");
        require(block.timestamp > offer.endTime, "The auction is not over yet");

        Bid memory bid = currentBid[_tokenID];
        if (bid.bidder != address(0)) {
            require(
                msg.sender == bid.bidder,
                "Only the buyer has the right to sell again"
            );
            uint256 seller_share0 = ((bid.value - offer.price) * sellerShare) /
                1000 +
                offer.price; //溢出的50% + 起拍价
            uint256 seller_share = (seller_share0 * (1000 - transferFee)) /
                1000; // 卖家实际分润（扣除了平台的2.5%）

            uint256 contract_share = ((bid.value - offer.price) *
                (1000 - sellerShare - bidderShare)) /
                1000 +
                (seller_share0 * transferFee) /
                1000; // 平台分润 = 溢出的20% + 从卖家收取的服务费2.5%

            uint256 share_Author = (contract_share * authorShare) / 1000; // 作者的分润 = 平台分润 * 2%

            if (offer.paymentToken == usdToken) {
                USDTLike(offer.paymentToken).transfer(
                    royalty[_tokenID],
                    share_Author
                );
                USDTLike(offer.paymentToken).transfer(
                    offer.seller,
                    seller_share
                );
            } else if (offer.paymentToken == address(0)) {
                payable(royalty[_tokenID]).transfer(share_Author);
                payable(offer.seller).transfer(seller_share);
            } else {
                ERC20Like(offer.paymentToken).transfer(
                    royalty[_tokenID],
                    share_Author
                );
                ERC20Like(offer.paymentToken).transfer(
                    offer.seller,
                    seller_share
                );
            }

            emit Bought(
                offer.seller,
                bid.bidder,
                _tokenID,
                bid.value,
                offer.paymentToken
            );
        } else {
            require(
                msg.sender == offer.seller,
                "Only the seller can restart the sale"
            );
            emit AuctionPass(_tokenID);
        }

        delete currentBid[_tokenID];

        _sell(_tokenID, _price, _paymentToken, _isBid, _startTime, _endTime);
    }

    function extractEth(uint256 amount) external onlyOwner {
        payable(owner).transfer(amount);
    }

    function extractUsdt(uint256 amount) external onlyOwner {
        USDTLike(usdToken).transfer(owner, amount);
    }

    function setTransferFee(uint256 _transferFee) external onlyOwner {
        require(_transferFee > 0);
        transferFee = _transferFee;
    }

    function setSellerShare(uint256 _sellerShare) external onlyOwner {
        require(_sellerShare > 0);
        sellerShare = _sellerShare;
    }

    function setAuthorShare(uint256 _authorShare) external onlyOwner {
        require(_authorShare > 0);
        authorShare = _authorShare;
    }

    function setbidderShare(uint256 _bidderShare) external onlyOwner {
        require(_bidderShare > 0);
        bidderShare = _bidderShare;
    }

    function setBidGrowth(uint256 _bidGrowth) external onlyOwner {
        require(_bidGrowth > 0);
        bidGrowth = _bidGrowth;
    }

    receive() external payable {}
}
