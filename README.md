# NFTBazaar-Contracts

### 一、NFTBazaar合约

| 网络  | 版本  | 合约地址                                       |
| ----- | ----- | ---------------------------------------------- |
| kovan | 1.0.0 | ~~0x0663b99715199d78850836Ba93dd479955E5105D~~ |
| kovan | 1.1.0 | 0x93e97BE3755EC8D54B464F310171c5DE51b1b461     |
| main  | 1.1.0 | 0x6Ab57bA03a16B5c5C5f8De955929bf14559FF7AF     |

#### 1. 主要函数

##### 1.1 资产总数量

function totalSupply() external view returns(uint256)

返回nft资产的总数量

##### 1.2 tokenURI

function tokenURI(uint256 tokenId) external view returns(string)

输入tokenId，返回该nft资产的URI链接地址。该链接格式应为json字符串，保存了资产meta数据。

##### 1.3 新增NFT

function awardItem(address player, string memory tokenUri) external returns (uint256)

创建nft资产。player资产owner钱包地址。tokenUri资产meta数据，一般为json格式的链接地址。

返回值uint256，是被创建的合约编号，即tokenID

#### 2. 合约ABI

```json
[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"approved","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Paused","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Unpaused","type":"event"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PAUSER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"player","type":"address"},{"internalType":"string","name":"tokenUri","type":"string"}],"name":"awardItem","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"paused","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"_data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenOfOwnerByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"unpause","outputs":[],"stateMutability":"nonpayable","type":"function"}]
```



### 二、NFTMarket合约

| 网络  | 版本  | 合约地址                                       | 备注                                              |
| ----- | ----- | ---------------------------------------------- | ------------------------------------------------- |
| kovan | 1.0.0 | ~~0xc839EB991094D611e08bc1C236f37551529aE534~~ |                                                   |
| kovan | 1.1.0 | 0x88Feb551Ef109685dFEb5962E81a6dcC74E7b6BC     | 合约保存“铸币者”地址，用于后续版本分润版税        |
| main  | 1.1.0 | 0xC2d34cA884dbB9fe930bd32Eba35c2Cc327CE304     |                                                   |
| kovan | 2.0.0 | ~~0x9b4EA46c32a6A7F2191786d7b9E387c448E6d8c5~~ |                                                   |
| kovan | 2.1.0 | 0x7E860d745B362E70E07ff05E2363173884341B79     | 调整event Offered，增加seller、isBid和endTime参数 |

#### 1. V1版主要函数

##### 1.1 创建nft资产，并自动上架售卖

function createAndSell(string memory _tokenURI, uint256 _price, address _paymentToken) external returns (uint256)

参数说明：

| 参数          | 类型    | 解释                                                         |
| ------------- | ------- | ------------------------------------------------------------ |
| _tokenURI     | string  | nft资产的meta信息                                            |
| _price        | uint256 | 售价。该数值需要附带小数位。eth有18个小数位，usdt有6个小数位。 |
| _paymentToken | address | 支付类型。eth对应0x0000000000000000000000000000000000000000。usdt对应0xB00Db1372E3B459697514213721118Faf75e3B6e |
| 返回值        | uint256 | tokenID                                                      |

##### 1.2 二次上架销售

function sell( uint256 _tokenID, uint256 _price, address _paymentToken) external

将已创建或以拥有的nft资产，挂在合约上进行售卖。

##### 1.3 取消售卖

function noLongerForSale(uint256 tokenID) external

##### 1.4 一口价购买

function buy(uint256 _tokenID) external payable

购买nft资产。允许使用eth或usdt进行购买nft资产。使用eth购买时，需要附加value值。使用usdt购买时，需要提前在usdt合约执行approve()方法为本合约授权等值可用额度。

##### 1.5 提现eth

function withdraw() external

卖家在寄卖时选择eth支付，当商品被售出时，货款保存在合约中，以pendingWithdrawals变量保存其可提现越。使用本方法，可将积累在合约中的eth一次性取出。

##### 1.6 查看订单

function nftOffered(uint256 _tokenID) external

查看订单接口。根据tokenid返回订单信息。

```json
struct Offer {
    bool isForSale;
    uint256 tokenID;
    address seller;
    uint256 price;
    address paymentToken;
}
```



#### 2. V1版合约ABI

```json
[{"inputs":[{"internalType":"address","name":"_nftAsset","type":"address"},{"internalType":"address","name":"_usdToken","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":true,"internalType":"address","name":"buyers","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"}],"name":"Bought","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"NoLongerForSale","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"}],"name":"Offered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"_from","type":"address"},{"indexed":true,"internalType":"address","name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"who","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Withdraw","type":"event"},{"inputs":[],"name":"acceptOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"}],"name":"buy","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"string","name":"_tokenURI","type":"string"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"}],"name":"createAndSell","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"newOwner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nftAsset","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"nftOffered","outputs":[{"internalType":"bool","name":"isForSale","type":"bool"},{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"address","name":"paymentToken","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"noLongerForSale","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"pendingWithdrawals","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"recoveryEth","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"recoveryUsdt","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"royalty","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"}],"name":"sell","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_transferFee","type":"uint256"}],"name":"setTransferFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"transferFee","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"usdToken","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"version","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"},{"stateMutability":"payable","type":"receive"}]
```

#### 3. V2版主要函数

##### 3.1 创建nft资产，并自动上架售卖

function createAndSell(string memory _tokenURI, uint256 _price, address _paymentToken, bool _isBid, uint256 _endTime) external returns (uint256)

参数说明：

| 参数          | 类型    | 解释                                                         |
| ------------- | ------- | ------------------------------------------------------------ |
| _tokenURI     | string  | nft资产的meta信息                                            |
| _price        | uint256 | 售价。该数值需要附带小数位。eth有18个小数位，usdt有6个小数位。 |
| _paymentToken | address | 支付类型。eth对应0x0000000000000000000000000000000000000000。usdt对应0xB00Db1372E3B459697514213721118Faf75e3B6e |
| _isBid        | bool    | 拍卖模式标记                                                 |
| _endTime      | uint256 | 拍卖结束时间。一口价模式本参数可填写为0                      |
| 返回值        | uint256 | tokenID                                                      |

##### 3.2 二次上架销售

function sell( uint256 _tokenID, uint256 _price, address _paymentToken, bool _isBid, uint256 _endTime) external

将已创建或以拥有的nft资产，挂在合约上进行售卖

##### 3.3 取消售卖

function noLongerForSale(uint256 tokenID) external

##### 3.4 一口价购买

function buy(uint256 _tokenID) external payable

购买nft资产。允许使用eth或usdt进行购买nft资产。使用eth购买时，需要附加value值。使用usdt购买时，需要提前在usdt合约执行approve()方法为本合约授权等值可用额度。

##### 3.5 查看订单

function nftOffered(uint256 _tokenID) external

查看订单接口。根据tokenid返回订单信息。

```json
struct Offer {
    bool isForSale;
    uint256 tokenID;
    address seller;
    uint256 price;
    address paymentToken;
}
```

##### 3.5 参与竞拍出价

function enterBid(uint256 tokenID, uint256 amount) external payable

如该资产需要eth支付，则需要注意传递相应数量的eth

##### 3.6 成交

function deal(uint256 tokenID) external

拍卖结束期后，通过本方法完成NFT资产转移、拍卖所得分配。

#### 4. V2版ABI

```json
[{"inputs":[{"internalType":"address","name":"_nftAsset","type":"address"},{"internalType":"address","name":"_usdToken","type":"address"},{"internalType":"address","name":"_previous_version","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"AuctionPass","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":true,"internalType":"address","name":"fromAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"BidEntered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":true,"internalType":"address","name":"buyers","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"}],"name":"Bought","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"NoLongerForSale","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"},{"indexed":false,"internalType":"bool","name":"isBid","type":"bool"},{"indexed":false,"internalType":"uint256","name":"endTime","type":"uint256"}],"name":"Offered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"_from","type":"address"},{"indexed":true,"internalType":"address","name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"inputs":[],"name":"acceptOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"bade","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"bidders","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"}],"name":"buy","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"string","name":"_tokenURI","type":"string"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"},{"internalType":"bool","name":"_isBid","type":"bool"},{"internalType":"uint256","name":"_endTime","type":"uint256"}],"name":"createAndSell","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"currentBid","outputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"deal","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"enterBid","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"newOwner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nftAsset","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"nftBids","outputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"nftOffered","outputs":[{"internalType":"bool","name":"isForSale","type":"bool"},{"internalType":"bool","name":"isBid","type":"bool"},{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"address","name":"paymentToken","type":"address"},{"internalType":"uint256","name":"endTime","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"noLongerForSale","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"offerBalances","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"previous_version","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"recoveryEth","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"recoveryUsdt","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"royalty","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"},{"internalType":"bool","name":"_isBid","type":"bool"},{"internalType":"uint256","name":"_endTime","type":"uint256"}],"name":"sell","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_transferFee","type":"uint256"}],"name":"setTransferFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"transferFee","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"usdToken","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"version","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"stateMutability":"payable","type":"receive"}]
```



### 三、编译合约命令

```shell
npx solcjs --base-path ./contracts/ ./contracts/NFTBazaar.sol --abi -o abis --overwrite && npx solcjs --base-path ./contracts/ ./contracts/NFTBazaar.sol --bin -o bin --overwrite

npx solcjs --base-path ./contracts/ ./contracts/NFTMarket.sol --abi -o abis --overwrite && npx solcjs --base-path ./contracts/ ./contracts/NFTMarket.sol --bin -o bin --overwrite
```

### 四、USDT合约地址

| 网络  | 合约地址                                   |
| ----- | ------------------------------------------ |
| kovan | 0xB00Db1372E3B459697514213721118Faf75e3B6e |
| main  | 0xdAC17F958D2ee523a2206206994597C13D831ec7 |

