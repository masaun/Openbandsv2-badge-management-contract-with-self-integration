echo "Remove existing modules in the `./contracts/lib/` directory in advance..."
rm -rf lib/* 

echo "Install the `foundry-rs/forge-std` libary..."
forge install foundry-rs/forge-std --no-commit