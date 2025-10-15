// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { IIdentityVerificationHubV2 } from "@selfxyz/contracts/contracts/interfaces/IIdentityVerificationHubV2.sol" ;
import { ProofOfHuman } from "./ProofOfHuman.sol";

/**
 * @title TestSelfVerificationRoot
 * @notice Test implementation of SelfVerificationRoot for testing purposes
 * @dev This contract provides a concrete implementation of the abstract SelfVerificationRoot
 */
contract SelfOnChainRecords {

    ProofOfHuman public proofOfHuman;

    constructor(
        ProofOfHuman _proofOfHuman
    ) {
        proofOfHuman = _proofOfHuman;
    }

    function verifyProof(bytes memory /* proofPayload */, bytes memory /* userContextData */) public view returns (bool) {
        // Check if verification was successful in the ProofOfHuman contract
        return proofOfHuman.verificationSuccessful();
    }



}
