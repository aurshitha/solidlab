// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


// Covers: Contract Structure, Variables, Functions, Visibility
// Problem:
// Write a smart contract called HelloWorld with:
// A string variable called greeting.
// A function setGreeting(string memory _greet) to set the greeting.
// A function getGreeting() that returns the greeting.

contract HelloWorld {
    string public greeting;
    function setGreeting(string memory _greet) public {
        greeting = _greet;
    }
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}

