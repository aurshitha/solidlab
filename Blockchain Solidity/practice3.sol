// -------------------------------------------

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 4. Simple Bank
// Covers: Use Cases, Types, Variables, Visibility, Functions
// Problem:
// Create a contract SimpleBank:
// Keep a mapping from address to balance.
// Function deposit() to accept ETH and update balance.
// Function getBalance() to return user’s balance.
// Function withdraw(uint amount) to withdraw from user balance.
// 💡 Bonus: Use payable, public, and view correctly.

contract SimpleBank {
    mapping(address => uint) public balance;
    // Mapping from address to balance

// Deposit ETH into contract
    function deposit() payable {
        // Accept ETH and update balance   
        balance[msg.sender] += msg.value;
    }

// Withdraw ETH from contract
    function withdraw(uint _amount) public  {
        // Withdraw from user balance
        require(balance[msg.sender] >= _amount, "Insufficient balance");
        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns(uint) {
        // Return user’s balance
        return balance[msg.sender];
    }
}

