const Web3 = require("web3");

// connect to ganache RPC server via providers
let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
// sending a chall to a smart contract
// data is hash encoded function signature
// call returns hash signature of function
web3.eth.call({
  // from Ganache account
  from: "0x59a475E88A957b2f6dFAAB8181b4A0B73c6fEA86",
  // to smart contract
  to:   "0x697A1fB55e00aD879a324cA123c8C0E47d13403f",
  // hash encoded function signature of myUint()
  data:  "0x06540f7e"
}).then(console.log);

// same can be achieved with encoding the function signature
web3.utils.sha3("myUint()");

// data field can be changed accordingly
web3.eth.call({
  from: "0x59a475E88A957b2f6dFAAB8181b4A0B73c6fEA86",
  to:   "0x697A1fB55e00aD879a324cA123c8C0E47d13403f",
  data:  web3.utils.sha3("myUint()")
}).then(console.log);

// making use of the ABI array instead
// signature contract(ABI, ADDR)
// ABI array & ADDR copied from Remix
let contract = new web3.eth.Contract([
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_myUint",
				"type": "uint256"
			}
		],
		"name": "setUnit",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
], "0x697A1fB55e00aD879a324cA123c8C0E47d13403f");

//console.log(contract);
// calling the myuint method from the contract
contract.methods.myUint().call().then(console.log);
// calling setUnit
contract.methods.setUnit(59).send({
  from: "0xE5944Fde53f9B751b943117af2764A89fA6d9F30"
}).then(console.log);
// calling the myuint method from the contract
contract.methods.myUint().call().then(console.log);


///
