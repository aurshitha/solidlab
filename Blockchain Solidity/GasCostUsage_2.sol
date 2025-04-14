// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasTest {
    event Log(string message, uint gasUsed);

    function sayHello() public {
        emit Log("Hello!", gasleft());
    }

    function internalCall() public {
        uint start = gasleft();
        sayHello();  // Internal call
        // Direct internal function call 
       // cheaper gas because it's like calling another function within the same file.
        uint used = start - gasleft();
        emit Log("Internal call gas used", used);
    }

    function externalCall() public {
        uint start = gasleft();
        this.sayHello(); // External call using this
        // self-call using the contract's own address(this)
        // treated as an external transaction, more gas used.
        uint used = start - gasleft();
        emit Log("External call gas used", used);
    }
}

contract GasTest2 {
    GasTest public gt;
    event log(string message, uint gasUsed);
    constructor(address _gt) {
        gt = GasTest(_gt);
    }

    function callInternalCall() public {
        uint startGas = gasleft();
        gt.sayHello();
        uint gasUsed = startGas - gasleft();
        emit log("Cross contract call executed", gasUsed);
    }

    function Compare_GasUsage() public {
        gt.internalCall();
        gt.externalCall();
    }
}

// 5666 - sayHello()
// 2187 - InternalCall() - {Internal call gas used}
// 2664 - ExternalCall() - {External call gas used}

// 7297 - cross contract called - callInternalCall() in GasTest2
// 2187 - Internal call gas used - InternalCall() 
// 2664 - External call gas used - ExternalCall()

// so the best way to call the external is making an instance and calling the function.


// -------------------------------------------------------------------------------------
// Call Type	        Description	                     Example in Code	   Cost
// -------------------------------------------------------------------------------------
// Internal Call	    Within the same contract	      hello()	           ✅ Low
// External Self-Call	Via this, still in same contract  this.hello()	       ❗ Higher
// Cross Contract Call	One contract calls another	      ca.hello() in CB	   🚨 Highest
