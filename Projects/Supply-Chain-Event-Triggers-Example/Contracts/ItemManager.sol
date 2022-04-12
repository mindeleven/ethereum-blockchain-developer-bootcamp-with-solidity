// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract ItemManager {

    enum SupplyChainState{Created, Paid, Delivered}

    // item structure
    struct S_Item {
        string _identifier;
        uint _itemPrice;
        ItemManager.SupplyChainState _state;
    }
    
    // storing the item
    mapping(uint => S_Item) public items;
    uint itemIndex;

    function createItem(string memory _identifier, uint _itemPrice) public {

    }

    function triggerPayment() public {

    }

    function triggerDelivery() public {

    }
}