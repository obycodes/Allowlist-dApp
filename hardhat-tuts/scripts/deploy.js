const { ethers } = require("hardhat");

async function main() {

  const allowlistContract = await ethers.getContractFactory("Allowlist");

  // deploy contract and specify max number of addresses to be allowlisted

  const deployedAllowlistContract = await allowlistContract.deploy(10);

  // wait for deployment to finalise
  await deployedAllowlistContract.deployed();

  // print the address of the deployed contract
  console.log("Allowlist Contract Address: " , deployedAllowlistContract.address);
}

// call main() and gracefully handle errors
main()
  .then(() => process.exit(0)) 
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
