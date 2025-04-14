// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// 1. Contact Book
// 🔧 Covers:
// Structs, Arrays, Use Cases
// 📝 Problem:
// Create a smart contract where a user can store their personal contact list.
// addContact(string _name, string _phoneNumber) → adds a new contact
//getMyContacts() → returns all contacts added by msg.sender
// Use:
// Struct to store contact details
// Mapping of address to array of contacts

contract ContactBook {
    // We want each contact to have a name and phone number.
    struct Contact {
        string name;
        string phoneNumber;
    }

     // We want each user (address) to have multiple contacts (array of Contact).
    mapping(address => Contact[]) public contacts;

    // Now we want users to add a new contact to their list.
    // We'll take name and phone number as input.
    function addContact(string memory _name, string memory _phoneNumber) public {
        contacts[msg.sender].push(Contact(_name, _phoneNumber));
    }

    // msg.sender: the address of the user calling the function
    // contacts[msg.sender]: fetches that user's contact list
    // .push(...): adds a new Contact to the array
    
    
    // Return the list of all contacts for the current user:
    function geyMyContacts() public view returns(Contact[] memory) {
        return contacts[msg.sender];
    }

}