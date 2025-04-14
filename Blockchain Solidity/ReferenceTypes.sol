// ------------------
//   Overview
// ------------------

// 1. structs
//    - you can create group of multiple variables under one name - 
//    - like a record or object in other languages.
    
// Example: 

pragma solidity ^0.8.0;

contract StudentInfo {
    struct Student {
        string name;
        uint age;
        bool isEnrolled;
    }

    Student public student1; // state variable declaration
    // OR public state variable of struct type Student
    // OR student1 is a public instance of the Student struct

    function setStudent() public {
        student1 = Student("Alice", 20, true);
    }
    // OR we can assign like this also:
        // student memory student1;
        // student1.name = "Alice";
        // student1.age = 20;
        // student1.isEnrolled = true;
}

// 2. Arrays
//   - collection of elements of the same type. Solidity supports:
        // 1. Fixed-size arrays
        // 2. Dynamic arrays

// We can declare an array like:
contract Mycontract {
    uint[] public array1 =[1, 2, 3];
    uint[] public array2;
    uint[10] public array3;
    string[] public array4 = ["apple", "banana", "carrot"];
    string[] public array5;
    string[10] public array6;
}



// Example:
pragma solidity ^0.8.0;

contract Numbers {
    uint[] public nums;

    function addNumber(uint num) public {
        nums.push(num);
    }

    function getNumber(uint index) public view returns(uint) {
        return nums[index];
    }

    function getLength() public view returns(uint) {
        return nums.length;
    }
}


// 3. Mappings
// A mapping is like a key-value store or dictionary. Think of it as a hash table.

// Example:
pragma solidity ^0.8.0;
contract MappingExample {
    mapping(address => uint) public balances;

    function updateBalance(uint amount) public {
        balances[msg.sender] = amount;
    }

    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }
}

// You can only get/set values — no way to iterate over keys
// Values for uninitialized keys return default (0, false, etc.)