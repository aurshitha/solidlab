// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 3. Student Marks Registry
// 🔧 Covers:
// Structs, Mappings, Use Cases
// 📝 Problem:
// Allow admin to record student scores:
// addStudent(address _student, string _name)
// recordMarks(address _student, uint _marks)
// getMarks(address _student) → returns marks
// Use:
// Struct for Student
// Mapping of address to student struct


contract studentRegistry {
    struct student {
        string name;
        uint marks;
    }

    mapping(address => student) public stu;
    function addStudent(address _student, string memory _name) public {
        stu[_student].name = _name;
    }
    function recordMarks(address _student, uint _marks) public{
        stu[_student].marks = _marks;
    }
    function getMarks(address _student) public view returns(uint) {
        return stu[_student].marks;
    }
}