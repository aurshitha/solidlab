// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 3. Personal Data Storage
// Covers: Structs, Types, Functions, Visibility
// Problem:
// Create a contract ProfileStorage to:
//  Define a struct Person with name (string), age (uint), and isActive (bool).
// Have a Person variable called personData.
// A function setProfile(string memory, uint, bool) to set the struct.
// A function getProfile() to return all values in the struct.

contract ProfileStorage {
    struct Person {
        string name;
        uint age;
        bool isActive;
    }
    
    Person private personData;

    function setProfile(string memory _name, uint _age, bool _isActive) public {
        // TO DO: Set the personData struct with the given values.
        personData = Person(_name, _age, _isActive);
    }

    function getProfile() public view returns(string memory, uint, bool) {
        // TO DO: Return all values in the personData struct.
        return (personData.name, personData.age, personData.isActive);
    }
}