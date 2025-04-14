// 7. Employee Database
// 🔧 Covers:
// Structs, Mappings
// 📝 Problem:
// Let the admin store employee details:
// addEmployee(address _emp, string name, uint age)
// getEmployee(address _emp) → returns employee data
// Use:
// Struct for Employee
// Mapping of address to Employee

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Employee_Database {
    struct employee {
        string name;
        uint age;
    }
    
    mapping(address => employee) public emp_base;

    function addEmployee(address _emp, string memory _name, uint age) public {
        emp_base[_emp] = employee(_name, age);

    }

    function getEmployee(address _emp) public view returns(employee memory) {
        return emp_base[_emp];
    }

}