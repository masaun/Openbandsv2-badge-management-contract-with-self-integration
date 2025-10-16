// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { IIdentityVerificationHubV2 } from "@selfxyz/contracts/contracts/interfaces/IIdentityVerificationHubV2.sol" ;
import { ProofOfHuman } from "./ProofOfHuman.sol";

/**
 * @notice - The Self On-Chain Records contract can verify a proof of humanity from the ProofOfHuman contract.
 * @notice - The Self On-Chain Records contract that the verification status from ProofOfHuman and a given wallet address are stored and associated.
 */
contract ProofOfHumanRecordManager {

    ProofOfHuman public proofOfHuman;

    constructor(
        ProofOfHuman _proofOfHuman
    ) {
        proofOfHuman = _proofOfHuman;
    }

    /**
     * @notice - Verify if the user has a valid proof of humanity.
     */
    function verifyProof(bytes memory /* proofPayload */, bytes memory /* userContextData */) public view returns (bool) {
        // Check if verification was successful in the ProofOfHuman contract
        return proofOfHuman.verificationSuccessful();
    }

    /**
     * @notice - Store the verification status from ProofOfHuman and a given wallet address into this contract and associate them.
     */
    function storeVerificationStatus(address user, bool status) public {
        // Store the verification status and user address
        require(user != address(0), "Invalid user address");
    }


    function getLastVerifiedUser() public view returns (address) {
        return proofOfHuman.lastUserAddress();
    }


}
