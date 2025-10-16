// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { IIdentityVerificationHubV2 } from "@selfxyz/contracts/contracts/interfaces/IIdentityVerificationHubV2.sol" ;
import { ProofOfHuman } from "./ProofOfHuman.sol";

import { DataType } from "./dataType/DataType.sol";

/**
 * @notice - The Self On-Chain Records contract can verify a proof of humanity from the ProofOfHuman contract.
 * @notice - The Self On-Chain Records contract that the verification status from ProofOfHuman and a given wallet address are stored and associated.
 */
contract ProofOfHumanRecordManager {
    ProofOfHuman public proofOfHuman;

    // @dev - Store an individual's proof related record.
    mapping (address => DataType.ProofOfHumanRecord) public proofOfHumanRecords;

    constructor(
        ProofOfHuman _proofOfHuman
    ) {
        proofOfHuman = _proofOfHuman;
    }

    /**
     * @notice - Verify if the user has a valid proof of humanity.
     * @dev - SelfVerificationRoot# verifySelfProof() is the write function - And therefore, a caller needs to pay for a gas fee.
     */
    function verifyProof(bytes calldata proofPayload, bytes calldata userContextData) public returns (bool) {
        // @dev - SelfVerificationRoot# verifySelfProof()
        proofOfHuman.verifySelfProof(proofPayload, userContextData);
        
        // Check if verification was successful in the ProofOfHuman contract
        return proofOfHuman.verificationSuccessful();
    }

    /**
     * @notice - Store the verification status from ProofOfHuman and a given wallet address into this contract and associate them.
     */
    function storeVerificationStatus(address walletAddress, bool status) public {
        require(walletAddress != address(0), "Invalid user address");

        // @dev - Get a verification config ID from the ProofOfHuman contract
        bytes32 verificationConfigId = proofOfHuman.verificationConfigId();

        // @dev - Store the verification status from ProofOfHuman and a given wallet address
        proofOfHumanRecords[walletAddress] = DataType.ProofOfHumanRecord({
            verificationConfigId: verificationConfigId,
            walletAddress: walletAddress,
            createdAt: block.timestamp
        });
    }


    function getLastVerifiedUser() public view returns (address) {
        return proofOfHuman.lastUserAddress();
    }


}
