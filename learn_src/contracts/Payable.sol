// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Payable {
    // Payable address can receive Ether
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }
    
}
