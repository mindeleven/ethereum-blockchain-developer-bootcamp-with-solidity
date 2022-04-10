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
  to:   "0xF3C05A9249E445641bb19F9E3E76b467148ECaa9",
  data:  "0x06540f7e"
}).then(console.log);

// same can be achieved with encoding the function signature
web3.utils.sha3("myUint()");

// data field can be changed accordingly
web3.eth.call({
  from: "0x59a475E88A957b2f6dFAAB8181b4A0B73c6fEA86",
  to:   "0xF3C05A9249E445641bb19F9E3E76b467148ECaa9",
  data:  web3.utils.sha3("myUint()")
}).then(console.log);
