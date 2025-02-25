# RLPReader.sol

View Source: [contracts/src/utils/RLPReader.sol](../../contracts/src/utils/RLPReader.sol)

**RLPReader**

## Structs
### RLPItem

```js
struct RLPItem {
 uint256 len,
 uint256 memPtr
}
```

## Contract Members
**Constants & Variables**

```js
uint8 internal constant STRING_SHORT_START;
uint8 internal constant STRING_LONG_START;
uint8 internal constant LIST_SHORT_START;
uint8 internal constant LIST_LONG_START;
uint8 internal constant MAX_SHORT_LEN;
uint8 internal constant WORD_SIZE;

```

## Functions

- [toRlpItem(bytes item)](#torlpitem)
- [toList(struct RLPReader.RLPItem item)](#tolist)
- [isList(struct RLPReader.RLPItem item)](#islist)
- [toAddress(struct RLPReader.RLPItem item)](#toaddress)
- [toUint(struct RLPReader.RLPItem item)](#touint)
- [countEncodedItems(struct RLPReader.RLPItem item)](#countencodeditems)
- [decodeItemLengthUnsafe(uint256 memPtr)](#decodeitemlengthunsafe)
- [decodePayloadOffset(struct RLPReader.RLPItem item)](#decodepayloadoffset)

### toRlpItem

Convert a dynamic bytes array into an RLPItem

```js
function toRlpItem(bytes item) internal pure
returns(struct RLPReader.RLPItem)
```

**Returns**

The decoded RLPItem

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | bytes | RLP encoded bytes | 

### toList

Convert a dynamic bytes array into a list of RLPItems

```js
function toList(struct RLPReader.RLPItem item) internal pure
returns(struct RLPReader.RLPItem[])
```

**Returns**

A list of RLPItems

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem | RLP encoded list in bytes | 

### isList

```js
function isList(struct RLPReader.RLPItem item) internal pure
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem |  | 

### toAddress

```js
function toAddress(struct RLPReader.RLPItem item) internal pure
returns(address)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem |  | 

### toUint

Create a uint256 from a RLPItem

```js
function toUint(struct RLPReader.RLPItem item) internal pure
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem | RLPItem | 

### countEncodedItems

Counts the number of payload items inside an RLP encoded list

```js
function countEncodedItems(struct RLPReader.RLPItem item) private pure
returns(uint256)
```

**Returns**

The number of items in a inside an RLP encoded list

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem | RLPItem | 

### decodeItemLengthUnsafe

Decodes the RLPItems length from a bytes array.

```js
function decodeItemLengthUnsafe(uint256 memPtr) internal pure
returns(uint256)
```

**Returns**

The encoded RLPItem length

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| memPtr | uint256 | Pointer to the dynamic bytes array in memory | 

### decodePayloadOffset

Decode the length of the RLPItem payload length

```js
function decodePayloadOffset(struct RLPReader.RLPItem item) internal pure
returns(uint256)
```

**Returns**

Length of the RLPItem payload length

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| item | struct RLPReader.RLPItem | RLPItem | 

## Contracts

* [Address](Address.md)
* [AddressPayable](AddressPayable.md)
* [Bits](Bits.md)
* [BlockController](BlockController.md)
* [BlockModel](BlockModel.md)
* [BondSize](BondSize.md)
* [ECDSA](ECDSA.md)
* [Erc20DepositVerifier](Erc20DepositVerifier.md)
* [Erc20Vault](Erc20Vault.md)
* [EthDepositVerifier](EthDepositVerifier.md)
* [EthVault](EthVault.md)
* [ExitableTimestamp](ExitableTimestamp.md)
* [ExitGameController](ExitGameController.md)
* [ExitGameRegistry](ExitGameRegistry.md)
* [ExitId](ExitId.md)
* [ExitPriority](ExitPriority.md)
* [FailFastReentrancyGuard](FailFastReentrancyGuard.md)
* [IERC20](IERC20.md)
* [IErc20DepositVerifier](IErc20DepositVerifier.md)
* [IEthDepositVerifier](IEthDepositVerifier.md)
* [IExitProcessor](IExitProcessor.md)
* [IOutputGuardHandler](IOutputGuardHandler.md)
* [IsDeposit](IsDeposit.md)
* [ISpendingCondition](ISpendingCondition.md)
* [IStateTransitionVerifier](IStateTransitionVerifier.md)
* [ITxFinalizationVerifier](ITxFinalizationVerifier.md)
* [Math](Math.md)
* [Merkle](Merkle.md)
* [Migrations](Migrations.md)
* [OnlyFromAddress](OnlyFromAddress.md)
* [OnlyWithValue](OnlyWithValue.md)
* [OutputGuardHandlerRegistry](OutputGuardHandlerRegistry.md)
* [OutputGuardModel](OutputGuardModel.md)
* [OutputId](OutputId.md)
* [Ownable](Ownable.md)
* [PaymentChallengeIFEInputSpent](PaymentChallengeIFEInputSpent.md)
* [PaymentChallengeIFENotCanonical](PaymentChallengeIFENotCanonical.md)
* [PaymentChallengeIFEOutputSpent](PaymentChallengeIFEOutputSpent.md)
* [PaymentChallengeStandardExit](PaymentChallengeStandardExit.md)
* [PaymentDeleteInFlightExit](PaymentDeleteInFlightExit.md)
* [PaymentEip712Lib](PaymentEip712Lib.md)
* [PaymentExitDataModel](PaymentExitDataModel.md)
* [PaymentExitGame](PaymentExitGame.md)
* [PaymentExitGameArgs](PaymentExitGameArgs.md)
* [PaymentInFlightExitModelUtils](PaymentInFlightExitModelUtils.md)
* [PaymentInFlightExitRouter](PaymentInFlightExitRouter.md)
* [PaymentInFlightExitRouterArgs](PaymentInFlightExitRouterArgs.md)
* [PaymentOutputGuardHandler](PaymentOutputGuardHandler.md)
* [PaymentOutputModel](PaymentOutputModel.md)
* [PaymentOutputToPaymentTxCondition](PaymentOutputToPaymentTxCondition.md)
* [PaymentPiggybackInFlightExit](PaymentPiggybackInFlightExit.md)
* [PaymentProcessInFlightExit](PaymentProcessInFlightExit.md)
* [PaymentProcessStandardExit](PaymentProcessStandardExit.md)
* [PaymentStandardExitRouter](PaymentStandardExitRouter.md)
* [PaymentStandardExitRouterArgs](PaymentStandardExitRouterArgs.md)
* [PaymentStartInFlightExit](PaymentStartInFlightExit.md)
* [PaymentStartStandardExit](PaymentStartStandardExit.md)
* [PaymentTransactionModel](PaymentTransactionModel.md)
* [PaymentTransactionStateTransitionVerifier](PaymentTransactionStateTransitionVerifier.md)
* [PlasmaFramework](PlasmaFramework.md)
* [PriorityQueue](PriorityQueue.md)
* [Protocol](Protocol.md)
* [Quarantine](Quarantine.md)
* [RLPReader](RLPReader.md)
* [SafeERC20](SafeERC20.md)
* [SafeEthTransfer](SafeEthTransfer.md)
* [SafeMath](SafeMath.md)
* [SpendingConditionRegistry](SpendingConditionRegistry.md)
* [TxFinalizationModel](TxFinalizationModel.md)
* [TxFinalizationVerifier](TxFinalizationVerifier.md)
* [TxPosLib](TxPosLib.md)
* [UtxoPosLib](UtxoPosLib.md)
* [Vault](Vault.md)
* [VaultRegistry](VaultRegistry.md)
* [WireTransaction](WireTransaction.md)
