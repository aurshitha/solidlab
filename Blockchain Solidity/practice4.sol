// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 5. Visibility Playground
// Covers: Visibility: public, private, internal, external
// Problem:
// Make a contract VisibilityTest:
// A private variable x = 100.
// A public function getX() that returns x.
// An internal function multiply(uint) that returns 2x input.
// An external function callMultiply(uint) that calls multiply() 
// and returns result.
// 💡 Bonus: Try accessing internal/private functions directly in Remix to see visibility limits.

contract VisibilityTest {
    uint private x = 100;

    function getX() public view returns(uint) {
        return x;
    }

    function multiply(uint _val) internal pure returns(uint) {
        return 2 * (_val);
    }

    function callMultiply(uint _val) external view returns(uint) {
        return multiply(_val);
    }
}

// 💡 private can't be accessed outside of the contract
// internal can't be accessed outside of the contract, 
// but can be accessed by other contracts.
// 💡 internal can be used in inherited contracts.
// 💡 external functions can only be called from outside the contract.


// there are four types of visibility:
            //  Who can access it?                        // can be called from within the same contract?
// 1. public   - anywhere (other contracts + externally)             yes
// 2. private  - only inside the same contract                       yes
// 3. internal - inside this contract + contract that inherit        yes
// 4. external - only from outside the contract                      No (not directly from within the same contract)

// pure: it doesn't read or write to state
// view: you're reading state

// If we to call the external function within the same contract: this.callMultiply(-...-)
// but this bit more expensive (rarelly needed inside your contract)
// 💡because it costs more gas

// internal:
//  - can be called from within the same contract
//  - and also from child contract (inherited ones)
//  here multiply() cannot be called directly from outside because it's not public/ external
