pragma solidity 0.8.28;

library DataType {

    // @dev - Store an individual's proof related record - based on the "payload" data 
    struct ProofOfHumanRecord {
        bytes32 verificationConfigId;
        uint256 chainId; 
        address userAddress;     // @dev - User ID in Self.xyz
        bool isAboveMinimumAge;
        bool isValidNationality;
        uint256 nullifier;     // @dev - The nullifier of the GenericDiscloseOutputV2 struct should be stored into here.
        uint256 createdAt;
    }

}