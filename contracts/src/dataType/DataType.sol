pragma solidity 0.8.28;

library DataType {

    struct ProofOfHumanRecord {
        bytes32 verificationConfigId;
        //bytes32 nullifierHash;
        address walletAddress;
        uint256 createdAt;
    }

}