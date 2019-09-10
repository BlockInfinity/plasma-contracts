pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "../interfaces/ISpendingCondition.sol";

/**
 * @title SpendingConditionRegistry
 * @notice The registry contracts of spending condition
 * @dev After regsiter all the essential condition contracts, the owner should renounce its ownership to make sure
 *      no further conditions would be registered for an ExitGame contracts.
 *      https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/ownership/Ownable.sol#L55
 */
contract SpendingConditionRegistry is Ownable {
    mapping(bytes32 => ISpendingCondition) _spendingConditions;

    function spendingConditions(uint256 outputType, uint256 spendingTxType) public view returns (ISpendingCondition) {
        bytes32 key = keccak256(abi.encode(outputType, spendingTxType));
        return _spendingConditions[key];
    }

    /**
     * @notice Register the spending condition contract.
     * @param outputType output type of the spending condition.
     * @param spendingTxType spending tx type of the spending condition.
     * @param condition The spending condition contract.
     */
    function registerSpendingCondition(uint256 outputType, uint256 spendingTxType, ISpendingCondition condition)
        public
        onlyOwner
    {
        require(outputType != 0, "Should not register with output type 0");
        require(spendingTxType != 0, "Should not register with output type 0");
        require(address(condition) != address(0), "Should not register an empty address");

        bytes32 key = keccak256(abi.encode(outputType, spendingTxType));
        require(address(_spendingConditions[key]) == address(0), "The output type has already been registered");

        _spendingConditions[key] = condition;
    }
}
