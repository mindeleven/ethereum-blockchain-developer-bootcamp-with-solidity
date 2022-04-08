// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

contract SimpleContract {

    uint public myUint = 10;

    function setUnit(uint _myUint) public {
        myUint = _myUint;
    }

}