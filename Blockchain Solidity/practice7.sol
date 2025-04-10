// 🧩 5. Number Storage with Owner
// 🔸 Covers:
// uint, visibility, msg.sender, require(), functions
//🔸 Problem:
// storeNumber(uint _num) → only the owner can call this
// getNumber() → returns stored number
// changeOwner(address _newOwner) → owner can transfer ownership
// 💡 Bonus: Add an event for number updates.

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract NumStorage {
    // Owner of the contract
    address private owner;

    // Stored number
    uint private num = 21;

    // Event for number updates
    event NumberUpdated(uint oldNum, uint newNum);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call");
        _;
    }

    function storeNumber(uint _num) public onlyOwner {
        // Update the stored number
        uint old = num;
        num = _num;
        emit NumberUpdated(old, _num);
    }

    function getNumber() public view returns(uint) {
        return num;
    }

// only the owner can change ownership
    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "New owner cannot be zero address");
        // Update the owner
        owner = _newOwner;
    }

    // we can view current owner
    function getOwner() public view returns(address) {
        return owner;
    }
}
