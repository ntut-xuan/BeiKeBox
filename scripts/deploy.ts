import { ethers } from "hardhat";

async function main() {
  const BeiKeBox = await ethers.getContractFactory("BeiKeBox");
  const beiKeBox = await BeiKeBox.deploy();

  await beiKeBox.deployed();

  console.log(`BeiKeBox deployed to ${beiKeBox.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
