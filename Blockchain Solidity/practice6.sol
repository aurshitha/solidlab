// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 🧩 3. Simple Access Control
// 🔸 Covers:
// require(), msg.sender, visibility, modifiers
// 🔸 Problem:
// Only the owner of the contract can change a stored message.
// setMessage(string _msg) → only owner can call
// getMessage() → anyone can view it
// getOwner() → return the owner address
// 💡 Bonus: Use a custom modifier onlyOwner.

contract simpleAccessControl {
    // The owner of the contract
    address private owner;
    string private message = "I am message";

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setMessage(string memory _msg) public onlyOwner {
        message = _msg;
    }
    
    function getMessage() public view returns(string memory) {
        return message;
    }

    function getOwner() public view returns(address) {
        return owner;
    } 
}