pragma solidity 0.8.28;

library DataType {

    struct SelfOnChainRecord {
        string domain;
        bytes32 nullifierHash;

        // @dev - Not genuine public inputs, which is emitted via zkJWT circuit. This is for the validation purpose.
        string emailHash;
        address walletAddress;
        string createdAt;
    }

}