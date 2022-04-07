// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

// Become Ethereum Blockchain Developer
// Project Shared Wallet
// https://ethereum-blockchain-developer.com/040-shared-wallet-project/00-overview/

// code challenge
// (1) deposit funds with fallback function
// (2) withdrawal function, takes also care of who's interacting with this wallet
// (3) permissions using modifier, checking the permissions

import "./Allowance.sol";

contract SharedWallet is Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    // function to get money out of the contract
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        // displaying error message to tell if there's enough ether
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        // owner can withdraw unlimited amount
        // not the owner - can only withdraw what's stored in the allowance
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    // overwriting renounceOwnership function 
    // to remove functionality to withdraw ownership
    function renounceOwnership() public override view onlyOwner {
        revert("Can't renounce ownership here");
    }
    
    // function to deposit money to the smart contract
    // deposit funds with fallback function
    receive() external payable {
      emit MoneyReceived(msg.sender, msg.value);
    }
}
