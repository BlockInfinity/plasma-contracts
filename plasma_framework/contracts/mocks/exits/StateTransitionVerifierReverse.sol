pragma solidity 0.5.11;
pragma experimental ABIEncoderV2;

import "../../src/exits/interfaces/IStateTransitionVerifier.sol";

contract StateTransitionVerifierReverse is IStateTransitionVerifier {

    function isCorrectStateTransition(
        bytes calldata, /*inFlightTx*/
        bytes[] calldata, /*inputTxs*/
        uint256[] calldata /*inputUtxosPos*/
    )
        external
        view
        returns (bool)
    {
        require(false, "Failing on purpose");
    }
}
