// 8. Event RSVP System
// 🔧 Covers:
// Arrays, Structs, Mappings
// 📝 Problem:
// Users can RSVP to an event.
// rsvp() → adds msg.sender to attendees list
// getAttendees() → returns list of all users who RSVP’d
// Use:
// Mapping to avoid duplicates
// Array to store attendees



// Requirements:
// 1. Users RSVP by calling rsvp().
// 2. Each user (i.e., msg.sender) can RSVP only once.
// 3. getAttendees() should return the list of all unique users who RSVP’d.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RSVP_System {
    mapping(address => bool) public hasRSVP;

    address[] public attendees;


    function rsvp() public {
        require(!hasRSVP[msg.sender], "You Have already RSVP");
        hasRSVP[msg.sender] = true;
        attendees.push(msg.sender);
    }

    function getAttendees() public view returns(address []) {
        return attendees;
    } 
}

// Feature	                 Purpose
// mapping(address => bool)	 To track if a user already RSVP’d (avoid duplicates).
// address[]	             To store the list of attendees.
// msg.sender              	 Represents the address of the user calling the function.