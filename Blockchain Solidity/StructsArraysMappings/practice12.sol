// 4. Todo List DApp
// 🔧 Covers:
// Structs, Arrays, Use Cases
// 📝 Problem:
// Let users maintain a personal todo list.
// addTask(string _description)
// getMyTasks()
// completeTask(uint _id)
// Use:
// Struct Task { string description; bool completed; }
// Mapping of address => Task[] to track per user


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract todoList {
    struct Task {
        string description;
        bool completed;
    }

    mapping(address => Task[]) public user_tasks;

    function addTask(string memory _description) public {
        user_tasks[msg.sender].push(Task(_description, false));
    }

    function completeTask(uint _id) public {
        require(_id < user_tasks[msg.sender].length, "Not exists in ToDo List");
        user_tasks[msg.sender][_id].completed = true;
    }

    function getMyTasks() public view returns(Task[] memory) {
        return user_tasks[msg.sender];
    }
}
