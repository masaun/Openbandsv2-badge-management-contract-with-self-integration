echo "Load the environment variables from the .env file..."
. ./.env

echo "Deploying & Verifying the OpenbandsV2BadgeManagerOnCelo contract on Celo Testnet (via CeloScan)..."
forge script script/celo-testnet/deployment/DeploymentForOpenbandsV2BadgeManagerOnCelo_celoscan.s.sol --slow --multi --broadcast --private-key ${CELO_TESTNET_PRIVATE_KEY} --verify --etherscan-api-key ${CELOSCAN_API_KEY}