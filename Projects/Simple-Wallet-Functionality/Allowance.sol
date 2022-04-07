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
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable {

    using SafeMath for uint;

    event AllowanceChanged(
        address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount
    );

    mapping(address => uint) public allowance;

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
    }

    function addAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        // owner is set in Ownable smart contract
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub( _amount));
        allowance[_who].sub(_amount);
    }
}