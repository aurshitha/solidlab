// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CA {
    event log(string mess, uint gasU);

    function h() public {
        emit log("hello", gasleft());
    }

    // callHelloInter() calls h() internally (within same contract), 
    // and measures the gas used in doing so.
    function callHelloInter() public {
        uint startgas = gasleft();
        h(); // internal call to `h`
        uint gasU = startgas - gasleft();
        emit log("Internal call Executed", gasU); // emit gas used
    }
}


contract CB {
    CA public cA;
    event log(string mess, uint gasU);

    constructor(address _cA) {
        cA = CA(_cA); // initialize CA's address
    }

    function callHelloEx() public {
        uint startgas = gasleft();
        cA.h(); // External call to h()
        uint gasU = startgas - gasleft();
        emit log("Cross contract call Executed", gasU); // log gas used
    }

    function Compare() public {
        cA.callHelloInter(); // internal call via CA
        CB.callHelloEx(); // callHelloEx()
    }
}


// OVERVIEW :
// Concept	Explanation

// gasleft()	        |   Returns the remaining gas left in the current execution context.
// emit log()	        |   Custom event logging message and gas used.
// callHelloInter()	    |   Measures internal call gas usage.
// callHelloEx()	    |   Measures cross-contract (external) call gas usage.
// constructor(address _cA)	Accepts address of deployed CA contract to interact with it.
// Compare()	        |   Intended to compare internal and external gas usage.



// ------------------------------
//      Conceptual Questions
// ------------------------------
// 1. What’s the difference between internal and external function calls in Solidity?
//  Ans. Internal can be called only within the same contract or derived contracts.
//      Internal calls are cheaper within the same contract. syntax- funcNmae(). They are used for resuable internal logic.
//      External can be called from other contracts or explicity called by using "this". 
//      External calls are costlier across contracts. syntax - contractInstance.funcName()


// 2. Why does an external call consume more gas than an internal one?
//  Ans. External calls involve creating a new memory, encoding/ decoding
//       the call data, security checks, such as access and gas limit. 
//      Where as internal calls are like simple function jumps inside the same contract.
//      so, external calls require more processing and thus consume more gas.


// 3. What does gasleft() do?
//  Ans. gasleft() is gloabl function that returns the amount of gas remmaining 
//       for the current transaction or call. It is used to measure or limit gas usage.


// 4. How do you calculate gas used in a function?
//  Ans. before function call - use gasleft()
//       after function call - use gasleft()
//       gas used = before - after
// --------------------------
//          code: 
// --------------------------
//      uint startGas = gasleft();
//      myFunction();
//      uint usedGas = startGas - gasleft();
//      emit log("Gas used", usedGas);


// 5. What are events used for in Solidity?
//  Ans. Events are used to log data on the blockchain.
//       Log are emitted by events are not stored in contract storage (gas efficient).
//       They are used for debugging, auditing, and monitoring purposes.
// --------------------------
//          syntax: 
// --------------------------
//      event Transfer(address from, address to, uint value);
//      emit Transfer(msg.sender, receiver, amount);