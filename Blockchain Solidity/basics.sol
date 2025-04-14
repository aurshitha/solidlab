// 🧩 The layout of solidity contract

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Mycontract {
    // State Variable
    // Constructor
    // Functions
}

// -------------------------------------------- //
//  🧩Variable - Used to store data
// Types:-
// 1. State Variables - (stored on blockchain)
// 2. Local Variables - (inside functions)
// 3. Global Variables - (e.g., msg.sender, block.timestamp)

// ------------------------------------------ //
// 🧩 Types - Data types you can use
// 1. Value types -> (uint, int, bool, bytes, address, enums, fixed point numbers)
// 2. Reference types -> (arrays, strings, struct, mapping)

// -------------------------------------------- //
// 🧩 Functions - Logic blocks that perform actions (used to perform operations)
// Types:-  
// 1. External functions - (can be called from outside the contract)
// 2. Internal functions - (can be called from inside the contract)
// 3. Private functions - (can be called from inside the contract, but not from outsid

function add(uint a, uint b) public view returns(uint) {
    return a + b;
}


// -------------------------------------------- //
// 🧩 Constructor - Special function that is called when the contract is deployed
// It is used to initialize the state variables of the contract
// It is only called once when the contract is deployed
// It is not possible to call the constructor after the contract has been deployed
// It is not possible to call the constructor from another contract
// It is not possible to call the constructor from a function


// -------------------------------------------- //
// 🧩 Visibility - who can call the function / variable
// 1. public - Anyone can call
// 2. internal - This contract + derived contracts
// 3. private - Only inside the same contract
// 4. external - Only external calls (not from within the contract)


// -------------------------------------------- //
// https://www.freecodecamp.org/news/what-are-solidity-modifiers/

// 🧩 Modifiers - A modifier is a special type of function that you use to 
// modify the behavior of other functions. 
// Modifiers allow you to add extra conditions or functionality 
// to a function without having to rewrite the entire function. 

modifier onlyOwner {
    //require((condition), "return message");
    require(msg.sender == owner, "Not owner");
    _; // indicate the end of the modifier and the beginning of the functiin that the modifier is modifying.
       // without this symbol, the compiler would not know where to insert the code from the modifier into the function.
}

function changeOwner(address newOwner) onlyOwner public {
    // function body
}

// -> the owner can only call the function "changeOwner", 
// if it fails, the require statement in the onlyOwner modifier will fail, 
// and the function doesn't excute.

// 🧩  Use of Multiple Modifiers on a Function:
contract MyContract{
   address owner;

   modifier ownerChanges {
       _;
       require(msg.sender == owner);
   }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

   function changeOwner(address newOwner) onlyOwner ownerChanges public {
       owner = newOwner;
   }
}

// The order you place your modifiers in doesn’t matter. 
// When you call the changeOwner function, the virtual machine executes 
// both onlyOwner and ownerChanges.

// Modifiers can have arguments and can be inherited and overridden 
// to customize their behavior, and they can be used in combination
// with other modifiers to further customize the behavior of functions

// ------------------------------------------------ //
// 🧩 Global Variables - built-in variables
// Examples:-
    // 1. msg.sender → caller's address
    // 2. msg.value → amount of ETH sent
    // 3. block.timestamp → current block time
    // so .... on




// ------------------------------------------------ //
// 🧩 Operators
// Examples:
    // +, -, *, / (Arithmetic)
    // ==, !=, <, > (Comparison)
    // &&, ||, ! (Logical)




// ------------------------------------------------ //
// 🧩 Arrays 



// ------------------------------------------------ //
// 🧩 Structs





// ------------------------------------------------ //
// 🧩 Mappings




// ------------------------------------------------ //
// 🧩 Events










// 1. require - (checks if a condition is true)
// 2. only - (checks if the sender is a specific address)
// 3. payable - (checks if the sender has sent enough ether)
// 4. pure - (checks if the function does not read or write state)
// 5. view - (checks if the function does not modify state)
// 6. nonReentrant - (checks if the function is not called recursively)
// They are used to add a condition to a function, variable, function call, or variable declaration

