// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

// Become Ethereum Blockchain Developer
// Project Shared Wallet
// https://ethereum-blockchain-developer.com/040-shared-wallet-project/00-overview/

// code challenge
// (1) deposit funds with fallback function
// (2) withdrawal function, takes also care of who's interacting with this wallet
// (3) permissions using modifier, checking the permissions

import "@openzeppelin/contracts/access/Ownable.sol";

contract SharedWallet is Ownable {

    // function to get money out of the contract
    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }
    
    // function to deposit money to the smart contract
    // deposit funds with fallback function
    receive() external payable {

    }
}
