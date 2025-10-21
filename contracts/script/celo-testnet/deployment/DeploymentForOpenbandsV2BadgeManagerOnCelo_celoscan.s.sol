pragma solidity ^0.8.17;

import "forge-std/Script.sol";

/// @dev - ZK (Ultraplonk) circuit, which is generated in Noir.
import { ProofOfHuman } from "../../../src/ProofOfHuman.sol";
import { OpenbandsV2BadgeManagerOnCelo } from "../../../src/OpenbandsV2BadgeManagerOnCelo.sol";

/**
 * @notice - Deployment script to deploy the OpenbandsV2BadgeManagerOnCelo SC - on Celo testnet
 */
contract DeploymentForOpenbandsV2BadgeManagerOnCelo_celoscan is Script {
    ProofOfHuman public proofOfHuman;
    OpenbandsV2BadgeManagerOnCelo public openbandsV2BadgeManager;

    function setUp() public {}

    function run() public {
        //vm.createSelectFork("https://forno.celo-sepolia.celo-testnet.org"); // @dev - [NOTE]: Hardcoded the Celo Testnet RPC URL - Instead of using the environment variable via the foundry.toml
        vm.createSelectFork('celo-sepolia');

        uint256 deployerPrivateKey = vm.envUint("CELO_TESTNET_PRIVATE_KEY");
        //uint256 deployerPrivateKey = vm.envUint("LOCALHOST_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        //vm.startBroadcast();

        /// @dev - Deploy SCs
        proofOfHuman = ProofOfHuman(vm.envAddress("PROOF_OF_HUMAN_CONTRACT_ON_CELO_TESTNET"));
        openbandsV2BadgeManager = new OpenbandsV2BadgeManagerOnCelo(proofOfHuman);

        vm.stopBroadcast();

        /// @dev - Logs of the deployed-contracts on Celo Mainnet
        console.logString("Logs of the deployed-contracts on Celo Testnet");
        console.logString("\n");
        console.log("%s: %s", "ProofOfHuman SC", address(proofOfHuman));
        console.logString("\n");
        console.log("%s: %s", "OpenbandsV2BadgeManagerOnCelo SC", address(openbandsV2BadgeManager));
    }
}

