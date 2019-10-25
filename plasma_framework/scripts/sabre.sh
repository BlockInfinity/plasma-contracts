#!/bin/bash

cd "$(dirname "$0")"

sabre analyze --mode full ../contracts/src/framework/PlasmaFramework.sol PlasmaFramework

sabre analyze --mode full ../contracts/src/vaults/Erc20Vault.sol Erc20Vault
sabre analyze --mode full ../contracts/src/vaults/verifiers/Erc20DepositVerifier.sol Erc20DepositVerifier

sabre analyze --mode full ../contracts/src/vaults/EthVault.sol Erc20Vault
sabre analyze --mode full ../contracts/src/vaults/verifiers/EthDepositVerifier.sol EthDepositVerifier

sabre analyze --mode full ../contracts/src/exits/payment/PaymentExitGame.sol PaymentExitGame
sabre analyze --mode full ../contracts/src/exits/payment/PaymentTransactionStateTransitionVerifier.sol PaymentTransactionStateTransitionVerifier
sabre analyze --mode full ../contracts/src/exits/utils/TxFinalizationVerifier.sol

sabre analyze --mode full ../contracts/src/exits/registries/SpendingConditionRegistry.sol SpendingConditionRegistry
sabre analyze --mode full ../contracts/src/exits/payment/spendingConditions/PaymentOutputToPaymentTxCondition.sol PaymentOutputToPaymentTxCondition

sabre analyze --mode full ../contracts/src/exits/registries/OutputGuardHandlerRegistry.sol OutputGuardHandlerRegistry
sabre analyze --mode full ../contracts/src/exits/payment/outputGuardHandlers/PaymentOutputGuardHandler.sol PaymentOutputGuardHandler

sabre analyze --mode full ../contracts/mocks/utils/RLPMock.sol RLPMock
sabre analyze --mode full ../contracts/src/utils/Bits.sol Bits
sabre analyze --mode full ../contracts/src/framework/utils/PriorityQueue.sol PriorityQueue
