const Web3 = require("web3");

// connect to ganache RPC server via providers
let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));

//console.log(web3);

// example to get balance of account
// returns promise that needs to resolve
console.log("Get balance from account");
web3.eth.getBalance("0xcE6391c7C3921A22487d0861fE297f3eB7AA0b55")
  .then(function(result) {
    console.log(web3.utils.fromWei(result, "ether"));
  });

// example to send transaction
console.log("Send 1 Ether");
web3.eth.sendTransaction({
  from: "0xcE6391c7C3921A22487d0861fE297f3eB7AA0b55",
  to:   "0xb8F0E9BA65F619f81E08c396a0cb2eA49192D2EA",
  value:  web3.utils.toWei("1", "ether")
});

console.log("Get balance from account");
web3.eth.getBalance("0xcE6391c7C3921A22487d0861fE297f3eB7AA0b55")
  .then(function(result) {
    console.log(web3.utils.fromWei(result, "ether"));
  });
