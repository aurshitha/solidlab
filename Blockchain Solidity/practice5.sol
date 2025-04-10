// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

//  6. Boolean State Toggle
// Covers: Boolean Type, Functions, Variables, Visibility
// Problem:
// Create a contract ToggleSwitch:
// A bool variable isOn.
// A function toggle() that switches the state.
// A function getState() that returns whether the switch is on or off.

contract ToggleSwitch {
    bool isOn;
   // by default the boolean is false
    
    function toggle() public  {
        isOn = !isOn;
    }

    function getState() public view returns(bool) {
        return isOn;
    }
}
