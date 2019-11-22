const EthVault = artifacts.require('EthVault');
const Erc20Vault = artifacts.require('Erc20Vault');
const ExitableTimestamp = artifacts.require('ExitableTimestampWrapper');
const ExitPriority = artifacts.require('ExitPriorityWrapper');
const ERC20Mintable = artifacts.require('ERC20Mintable');
const PaymentExitGame = artifacts.require('PaymentExitGame');
const PaymentProcessStandardExit = artifacts.require('PaymentProcessStandardExit');
const PlasmaFramework = artifacts.require('PlasmaFramework');

const {
    BN, constants, expectEvent, expectRevert, time,
} = require('openzeppelin-test-helpers');
const { expect } = require('chai');

const { EMPTY_BYTES, SAFE_GAS_STIPEND } = require('../helpers/constants.js');
const { MerkleTree } = require('../helpers/merkle.js');
const { PaymentTransactionOutput, PaymentTransaction } = require('../helpers/transaction.js');
const {
    computeDepositOutputId, computeNormalOutputId, spentOnGas, exitQueueKey,
} = require('../helpers/utils.js');
const { sign } = require('../helpers/sign.js');
const { hashTx } = require('../helpers/paymentEip712.js');
const { buildUtxoPos, utxoPosToTxPos } = require('../helpers/positions.js');
const Testlang = require('../helpers/testlang.js');
const config = require('../../config.js');

contract('PaymentExitGame - End to End Tests', ([_deployer, _maintainer, authority, bob, richFather]) => {
    const ETH = constants.ZERO_ADDRESS;
    const DEPOSIT_VALUE = 1000000;
    const OUTPUT_TYPE_PAYMENT = config.registerKeys.outputTypes.payment;

    const alicePrivateKey = '0x7151e5dab6f8e95b5436515b83f423c4df64fe4c6149f864daa209b26adb10ca';
    let alice;

    const setupAccount = async () => {
        const password = 'password1234';
        alice = await web3.eth.personal.importRawKey(alicePrivateKey, password);
        alice = web3.utils.toChecksumAddress(alice);
        web3.eth.personal.unlockAccount(alice, password, 3600);
        web3.eth.sendTransaction({ to: alice, from: richFather, value: web3.utils.toWei('1', 'ether') });
    };

    const setupContracts = async () => {
        this.framework = await PlasmaFramework.deployed();
        this.ethVault = await EthVault.at(await this.framework.vaults(config.registerKeys.vaultId.eth));
        this.exitGame = await PaymentExitGame.at(await this.framework.exitGames(config.registerKeys.txTypes.payment));

        this.startStandardExitBondSize = await this.exitGame.startStandardExitBondSize();

        this.framework.addExitQueue(config.registerKeys.vaultId.eth, ETH);
    };

    const aliceDepositsETH = async () => {
        const depositBlockNum = (await this.framework.nextDepositBlock()).toNumber();
        this.depositUtxoPos = buildUtxoPos(depositBlockNum, 0, 0);
        this.depositTx = Testlang.deposit(OUTPUT_TYPE_PAYMENT, DEPOSIT_VALUE, alice);
        this.merkleTreeForDepositTx = new MerkleTree([this.depositTx], 16);
        this.merkleProofForDepositTx = this.merkleTreeForDepositTx.getInclusionProof(this.depositTx);

        return this.ethVault.deposit(this.depositTx, { from: alice, value: DEPOSIT_VALUE });
    };

    const aliceTransferSomeEthToBob = async () => {
        const tranferTxBlockNum = (await this.framework.nextChildBlock()).toNumber();
        this.transferUtxoPos = buildUtxoPos(tranferTxBlockNum, 0, 0);

        const transferAmount = 1000;
        const outputBob = new PaymentTransactionOutput(OUTPUT_TYPE_PAYMENT, transferAmount, bob, ETH);
        this.transferTxObject = new PaymentTransaction(1, [this.depositUtxoPos], [outputBob]);
        this.transferTx = this.transferTxObject.rlpEncoded();
        this.merkleTreeForTransferTx = new MerkleTree([this.transferTx]);
        this.merkleProofForTransferTx = this.merkleTreeForTransferTx.getInclusionProof(this.transferTx);

        await this.framework.submitBlock(this.merkleTreeForTransferTx.root, { from: authority });
    };


    describe('Given Alice deposited ETH and transfers it to Bob', () => {
        before(async () => {
            await setupAccount();
            await aliceDepositsETH();
            await aliceTransferSomeEthToBob();
        });

        describe('Alice starts a standard exit from the deposit', () => {

            describe('Bob challenges the exit', () => {

                it('Alice can not restart the exit', () => {

                });

                it('no funds are exit during processing exits', () => {

                });
            });
        });
    });
});
