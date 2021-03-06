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
    string public constant version = "1.1.0";
    uint256 public transferFee = 5;

    struct Offer {
        bool isForSale;
        uint256 tokenID;
        address seller;
        uint256 price;
        address paymentToken;
    }

    mapping(uint256 => address) public royalty;
    mapping(uint256 => Offer) public nftOffered;
    mapping(address => uint256) public pendingWithdrawals;

    event Offered(uint256 indexed tokenID, uint256 price, address paymentToken);
    event Bought(
        address indexed seller,
        address indexed buyers,
        uint256 indexed tokenID,
        uint256 price,
        address paymentToken
    );
    event NoLongerForSale(uint256 indexed tokenID);
    event Withdraw(address indexed who, uint256 value);

    constructor(address _nftAsset, address _usdToken) {
        nftAsset = _nftAsset;
        usdToken = _usdToken;
    }

    function createAndSell(
        string memory _tokenURI,
        uint256 _price,
        address _paymentToken
    ) external returns (uint256) {
        uint256 tokenID =
            ERC721Like(nftAsset).awardItem(address(this), _tokenURI);

        royalty[tokenID] = msg.sender;
        _sell(tokenID, _price, _paymentToken);

        return tokenID;
    }

    function sell(
        uint256 _tokenID,
        uint256 _price,
        address _paymentToken
    ) external {
        ERC721Like(nftAsset).transferFrom(msg.sender, address(this), _tokenID);
        _sell(_tokenID, _price, _paymentToken);
    }

    function _sell(
        uint256 _tokenID,
        uint256 _price,
        address _paymentToken
    ) internal {
        if (_paymentToken != address(0)) {
            nftOffered[_tokenID] = Offer(
                true,
                _tokenID,
                msg.sender,
                _price,
                usdToken
            );
        } else {
            nftOffered[_tokenID] = Offer(
                true,
                _tokenID,
                msg.sender,
                _price,
                _paymentToken
            );
        }

        emit Offered(_tokenID, _price, _paymentToken);
    }

    function noLongerForSale(uint256 tokenID) external {
        Offer memory offer = nftOffered[tokenID];
        require(offer.isForSale, "nft not actually for sale");
        require(msg.sender == offer.seller, "Only the seller can operate");

        ERC721Like(nftAsset).transferFrom(address(this), offer.seller, tokenID);
        delete nftOffered[tokenID];
        emit NoLongerForSale(tokenID);
    }

    function buy(uint256 _tokenID) external payable {
        Offer memory offer = nftOffered[_tokenID];
        require(offer.isForSale, "nft not actually for sale");
        uint256 share1 = (offer.price * transferFee) / 100;

        if (offer.paymentToken != address(0)) {
            USDTLike(offer.paymentToken).transferFrom(
                msg.sender,
                address(this),
                offer.price
            );
            USDTLike(offer.paymentToken).transfer(
                offer.seller,
                offer.price - share1
            );
        } else {
            require(
                msg.value >= offer.price,
                "Sorry, your credit is running low"
            );
            pendingWithdrawals[offer.seller] += offer.price - share1;
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

    function withdraw() external {
        uint256 amount = pendingWithdrawals[msg.sender];
        pendingWithdrawals[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function recoveryEth(uint256 amount) external onlyOwner {
        payable(owner).transfer(amount);
    }

    function recoveryUsdt(uint256 amount) external onlyOwner {
        USDTLike(usdToken).transfer(owner, amount);
    }

    function setTransferFee(uint256 _transferFee) external onlyOwner {
        require(_transferFee > 0);
        transferFee= _transferFee;
    }

    receive() external payable {}
}