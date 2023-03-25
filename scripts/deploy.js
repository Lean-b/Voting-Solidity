const  {ethers}  = require("ethers");

async function main() {
  const Voting = await ethers.getContractFactory("Voting");
  const votings = await Voting.deploy();
  await votings.deployed();
  console.log("Voting deployed to:", voting.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });