# NFTBazaar-Contracts

### 一、NFTBazaar合约

| 网络  | 版本  | 合约地址                                       |
| ----- | ----- | ---------------------------------------------- |
| kovan | 1.0.0 | ~~0x0663b99715199d78850836Ba93dd479955E5105D~~ |
| kovan | 1.1.0 | 0x93e97BE3755EC8D54B464F310171c5DE51b1b461     |
| polygon-test | 1.1.0 | 0x545e5F9983EDc7374102cBA70e78c34CD2Cb85E6 |
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

##### 1.4 允许其他账户转移NFT资产

approve(address to, uint256 tokenId) external

授予将TokenId令牌传输到另一个帐户的权限。在传送令牌时，审批将被清除。

一次只能批准一个帐户，因此批准零地址将清除先前的审批。

要求：调用方必须拥有令牌或者是经过批准的操作员。令牌必须存在。

##### 1.5 查看当前授权情况

getApproved(uint256 tokenId) external returns(address operator)

#### 2. 合约ABI

```json
[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"approved","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Paused","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"Unpaused","type":"event"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PAUSER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"player","type":"address"},{"internalType":"string","name":"tokenUri","type":"string"}],"name":"awardItem","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"paused","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"_data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint256","name":"index","type":"uint256"}],"name":"tokenOfOwnerByIndex","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"unpause","outputs":[],"stateMutability":"nonpayable","type":"function"}]
```



### 二、NFTMarket合约

| 网络  | 版本  | 合约地址                                       | 备注                                                         |
| ----- | ----- | ---------------------------------------------- | ------------------------------------------------------------ |
| kovan | 1.0.0 | ~~0xc839EB991094D611e08bc1C236f37551529aE534~~ |                                                              |
| kovan | 1.1.0 | 0x88Feb551Ef109685dFEb5962E81a6dcC74E7b6BC     | 1. 合约保存“铸币者”地址，用于后续版本分润版税                |
| polygon-test | 1.1.0 | 0xeAD9F3dF4bBCd2fc26a7E69695Ca0be6b95cB763 | 1.版本一首次部署在polygon测试网络上
| kovan | 2.0.0 | ~~0x9b4EA46c32a6A7F2191786d7b9E387c448E6d8c5~~ |                                                              |
| kovan | 2.1.0 | ~~0x7E860d745B362E70E07ff05E2363173884341B79~~ | 1. 调整event Offered，增加seller、isBid和endTime参数         |
| kovan | 2.2.0 | ~~0xA3c35B7f3f42B606A2a44bc55B0Be6184Da1E25c~~ | 1. 更新竞拍标准，每次加价不低于10%<br />2. 各种费率使用变量且可通过管理员进行设置。均为千分制。 |
| kovan | 2.2.2 | ~~0x8626b6aDF816d41745Bf59C6aB911d2f27a0d969~~ | 1. 给拍卖endTime增加限制，最短10分钟，最长12周<br />2. 修复溢价分润的bug |
| kovan | 2.3.0 | ~~0x6509E0f871dAF8ec90210c925714A9a07d7bA418~~ | 1. 最新分润标准<br />2. 一口价模式给作者分润<br />3. 禁止卖家参与竞拍<br />4. 每次竞拍退还上一个竞拍者的资金并将溢出金额的30%分润 |
| kovan | 2.5.0 | ~~0x3268f61fe09eB649a08B7Eaba67818d7e320d686~~ | 1. 增加拍卖开始时间<br />2. 增加reSelling方法将流拍的NFT重新上架销售 |
| kovan | 2.5.1 | ~~0x2917331Da36de678B652a3b35c8190C7CC3c986A~~ | 1. 修复竞价公式bug                                           |
| kovan | 2.5.3 | ~~0xa82373cC65Bf4423B6025d213880c4F4D7BCFA1b~~ | 1. 增加对开始时间及结束时间的约束规则<br />2. 增加对初始价格的约束规则：拍卖最低价格$150或0.05 ETH |
| kovan | 2.5.5 | ~~0x984967f140C10CCE9D325FE3698Ee37D5E7922fd~~ | 1. 解除对固定价格下限约束，只对拍卖价格限制为大于零<br />2. 调整reSelling方法，允许买家不取回NFT直接上架销售 |
| kovan | 2.6.0 | ~~0x39A6e8B8e33ce6B27c44d2D0C3C35b6a49AF5a0F~~ | 1. 新增changePrice方法，固定价格可以调整价格及支付币种       |
| kovan | 2.6.1 | ~~0x66B35621b2fC36d35579B091507778109d228551~~ | 1. 新增ChangePrice事件，记录价格改变。                       |
| kovan | 2.6.2 | ~~0xb714Ff6DAB31fBdFa3351f44eD073b4d7B5eedC6~~ | 1. 修复reSelling方法漏洞，增加 _lock_ 修改器，防止合约重入   |
| kovan | 2.7.0 | ~~0xf071b4EB3e9407D6fE1A3f0255011eb42e56f1C9~~ | 1.支持zUSD购买                                               |
| kovan | 2.7.1 | 0x52e11c98793562c11dFFF74f6E3316a8Abeff27f     | 1.修复_sell方法bug，保存正确的_paymentToken                  |
| polygon-test | 2.7.1 | 0x13aEB0D1D038A4BB08ed01957a2743651D32B015 | 1.支持zUSD版本首次部署在polygon测试网络 |
| main  | 1.1.0 | 0xC2d34cA884dbB9fe930bd32Eba35c2Cc327CE304     |                                                              |

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

##### 1.2 直接上架销售

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

function createAndSell(string memory _tokenURI, uint256 _price, address _paymentToken, bool _isBid, uint256 _startTime, uint256 _endTime) external returns (uint256)

参数说明：

| 参数          | 类型    | 解释                                                         |
| ------------- | ------- | ------------------------------------------------------------ |
| _tokenURI     | string  | nft资产的meta信息                                            |
| _price        | uint256 | 售价。该数值需要附带小数位。eth有18个小数位，usdt有6个小数位。 |
| _paymentToken | address | 支付类型。eth对应0x0000000000000000000000000000000000000000。usdt对应0xB00Db1372E3B459697514213721118Faf75e3B6e |
| _isBid        | bool    | 拍卖模式标记                                                 |
| _startTime    | uint256 | 拍卖开始时间的时间戳，单位为秒。不能小于当前时间。           |
| _endTime      | uint256 | 拍卖结束时间的时间戳，单位为秒。一口价模式本参数可填写为0，限时拍卖最小值为10分钟后以及12周以内。 |
| 返回值        | uint256 | tokenID                                                      |

##### 3.2 直接上架销售

function sell( uint256 _tokenID, uint256 _price, address _paymentToken, bool _isBid, uint256 _startTime, uint256 _endTime) external

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

eth支付时，amount数量必须与msg.value相同

##### 3.6 成交

function deal(uint256 tokenID) external

拍卖结束期后，通过本方法完成NFT资产转移、拍卖所得分配。

##### 3.7 再次销售

function reSelling(uint256 _tokenID, uint256 _price, address _paymentToken, bool _isBid, uint256 _startTime, uint256 _endTime) external

当拍卖时间结束，尚未有用户参与竞价，则商品流拍。卖家可以通过本方法将艺术品直接上架销售而不必从合约中取回nft后再调用销售方法。

##### 3.8 调整价格

function changePrice(uint256 tokenID, uint256 price, address paymentToken) external

当固定模式销售长时间无人购买时，卖家可以直接根据市场情况调整NFT的报价及支付币种，且不比将商品下架后再重新上架。

#### 4. V2版ABI

```json
[{"inputs":[{"internalType":"address","name":"_nftAsset","type":"address"},{"internalType":"address","name":"_usdToken","type":"address"},{"internalType":"address","name":"_previous_version","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"AuctionPass","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":true,"internalType":"address","name":"fromAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"BidEntered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":true,"internalType":"address","name":"buyers","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"}],"name":"Bought","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"NoLongerForSale","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenID","type":"uint256"},{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"},{"indexed":false,"internalType":"address","name":"paymentToken","type":"address"},{"indexed":false,"internalType":"bool","name":"isBid","type":"bool"},{"indexed":false,"internalType":"uint256","name":"startTime","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"endTime","type":"uint256"}],"name":"Offered","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"_from","type":"address"},{"indexed":true,"internalType":"address","name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"inputs":[],"name":"acceptOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"authorShare","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"bidGrowth","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"bidderShare","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"}],"name":"buy","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"string","name":"_tokenURI","type":"string"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"},{"internalType":"bool","name":"_isBid","type":"bool"},{"internalType":"uint256","name":"_startTime","type":"uint256"},{"internalType":"uint256","name":"_endTime","type":"uint256"}],"name":"createAndSell","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"currentBid","outputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"bidder","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"deal","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"enterBid","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"extractEth","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"extractUsdt","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"newOwner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nftAsset","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"nftOffered","outputs":[{"internalType":"bool","name":"isForSale","type":"bool"},{"internalType":"bool","name":"isBid","type":"bool"},{"internalType":"uint256","name":"tokenID","type":"uint256"},{"internalType":"address","name":"seller","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"address","name":"paymentToken","type":"address"},{"internalType":"uint256","name":"startTime","type":"uint256"},{"internalType":"uint256","name":"endTime","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenID","type":"uint256"}],"name":"noLongerForSale","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"previous_version","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"},{"internalType":"bool","name":"_isBid","type":"bool"},{"internalType":"uint256","name":"_startTime","type":"uint256"},{"internalType":"uint256","name":"_endTime","type":"uint256"}],"name":"reSelling","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"royalty","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenID","type":"uint256"},{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_paymentToken","type":"address"},{"internalType":"bool","name":"_isBid","type":"bool"},{"internalType":"uint256","name":"_startTime","type":"uint256"},{"internalType":"uint256","name":"_endTime","type":"uint256"}],"name":"sell","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"sellerShare","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_authorShare","type":"uint256"}],"name":"setAuthorShare","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_bidGrowth","type":"uint256"}],"name":"setBidGrowth","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_sellerShare","type":"uint256"}],"name":"setSellerShare","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_transferFee","type":"uint256"}],"name":"setTransferFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_bidderShare","type":"uint256"}],"name":"setbidderShare","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"transferFee","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"usdToken","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"version","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"stateMutability":"payable","type":"receive"}]
```



### 三、编译合约命令

```shell
npx solcjs --base-path ./contracts/ ./contracts/NFTBazaar.sol --abi -o abis --overwrite && npx solcjs --base-path ./contracts/ ./contracts/NFTBazaar.sol --bin -o bin --overwrite

npx solcjs --base-path ./contracts/ ./contracts/NFTMarket.sol --abi -o abis --overwrite && npx solcjs --base-path ./contracts/ ./contracts/NFTMarket.sol --bin -o bin --overwrite

npx solcjs --base-path ./contracts/ ./contracts/NFTMarket_v2.sol --abi -o abis --overwrite && npx solcjs --base-path ./contracts/ ./contracts/NFTMarket_v2.sol --bin -o bin --overwrite
```

### 四、USDT合约地址

| 网络  | 合约地址                                   |
| ----- | ------------------------------------------ |
| kovan | 0xB00Db1372E3B459697514213721118Faf75e3B6e |
| polygon-test| 0x18531AD00605c4eF83621279FA6B55d8BB80caA3 |
| main  | 0xdAC17F958D2ee523a2206206994597C13D831ec7 |

