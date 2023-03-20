const { ethers } = require("hardhat");

async function main() {

  const Voting = await ethers.getContractFactory("Voting");
  const VotingContract = await Voting.deploy(["0x52657075626c6963616e6f73","0x44656d6f637261746173"]);//Bytes32 ["0x5645645631534640021541"]  https://www.devoven.com/string-to-bytes32
  await VotingContract.deployed();

  console.log("Contract desploy:", VotingContract)

}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
