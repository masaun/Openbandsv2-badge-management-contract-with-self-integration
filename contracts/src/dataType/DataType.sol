pragma solidity 0.8.28;

library DataType {

    struct ProofOfHumanRecord {
        bytes32 verificationConfigId;
        uint256 nullifier; // @dev - The nullifier of the GenericDiscloseOutputV2 struct should be stored into here.
        address walletAddress;
        uint256 createdAt;
    }

}