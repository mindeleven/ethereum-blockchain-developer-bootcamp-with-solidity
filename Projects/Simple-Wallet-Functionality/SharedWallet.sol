// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

// Become Ethereum Blockchain Developer
// Project Shared Wallet
// https://ethereum-blockchain-developer.com/040-shared-wallet-project/00-overview/

// code challenge
// (1) deposit funds with fallback function
// (2) withdrawal function, takes also care of who's interacting with this wallet
// (3) permissions using modifier, checking the permissions

contract SharedWallet {

    // Securing the smart contract by setting the owner
    address public owner;

    constructor() {
        owner = msg.sender;
    }
   
    // function to get money out of the contract
    function withdrawMoney(address payable _to, uint _amount) public {
        // secure witdrawal function
        require(owner == msg.sender, "You're not allowed");
        _to.transfer(_amount);
    }
    
    // function to deposit money to the smart contract
    // deposit funds with fallback function
    receive() external payable {

    }
}
