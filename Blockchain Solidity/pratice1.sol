// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 2. Simple Counter
// Covers: Variables, Functions, Visibility, Types
// Problem:
// Create a contract Counter with:
// A private integer variable count.
// A public function increment() to increase the counter.
// A public function decrement() to decrease it.
// A view function getCount() to return the current value.

contract Counter {
    // Private integer variable count
    uint private count = 0;

    function increment() public {
        // Increase the counter
        count++;
    }
    
    function decrement() public {
        // Decrease the counter, but not below 0
        if (count > 0) {
            count--;
        }
    }

    function getCount() public view returns(uint) {
        // Return the current value
        return count;
    }
}