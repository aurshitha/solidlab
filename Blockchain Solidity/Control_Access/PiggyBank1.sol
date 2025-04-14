// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 🧩 1. Piggy Bank
// 🔸 Covers:
// mapping, payable, msg.sender, functions, withdraw
// 🔸 Problem:
// Create a contract where users can deposit ETH into their personal piggy bank.
// Only the owner of the piggy bank (i.e., msg.sender) can:
// deposit ETH
// view their savings
// withdraw all their savings
// 💡 Bonus: Prevent users from withdrawing 0 balance.


contract PiggyBank {
    // Mapping to store each user's balance
    mapping(address => uint256) public balance;

    // Deposit ETH into personal piggy bank
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    // View user's own savings
    function getSavings() public view returns (uint256) {
        return balance[msg.sender];
    }

    // Withdraw ETH from personal piggy bank
    function withdraw(uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "Insufficient balance");
        require(_amount > 0, "Cannot withdraw 0 amount");

        balance[msg.sender] -= _amount;
        
        // Transfer the ETH to the user
        payable(msg.sender).transfer(_amount);
    }
}


// ✅ Everyone manages their own savings
// ❌ No admin control over all funds
// ✅ Suitable for decentralized piggy bank use
// ---------------------------------------------------------------------------------

contract Admin_PiggyBank {
    mapping(address => uint256) public balance;
    address private owner;

    constructor() {
        owner = msg.sender; // The deployer becomes the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Anyone can deposit, like into a shared vault
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    // Only the owner can check others’ savings
    function getUserSavings(address user) public view onlyOwner returns (uint256) {
        return balance[user];
    }

    // Only the owner can withdraw anyone's funds (to owner)
    function withdrawFrom(address user, uint256 _amount) public onlyOwner {
        require(balance[user] >= _amount, "Insufficient balance");
        require(_amount > 0, "Cannot withdraw 0 amount");

        balance[user] -= _amount;
        payable(owner).transfer(_amount);
    }
}

// ✅ Centralized control
// ✅ Useful for organizations, donation platforms, custodial wallets
// ❌ Regular users cannot withdraw their funds.
// ---------------------------------------------------------------------------------


// 🔓 Users can:
// 1. Deposit ETH
// 2. View their own savings
// 3. Withdraw their own ETH

// 🔐 Owner (admin) can:
// 1. View any user's savings
// 2. Withdraw any user's savings to admin's address (e.g., for emergency override or centralized apps).

contract HybridPiggyBank {
    address private owner;
    mapping(address => uint256) public balance;

    constructor() {
        owner = msg.sender; // Set contract deployer as the admin
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    // 🟢 Anyone can deposit ETH
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balance[msg.sender] += msg.value;
    }

    // 🟢 Users can check their own balance
    function getMySavings() public view returns (uint256) {
        return balance[msg.sender];
    }

    // 🔐 Admin can check any user's balance
    function getUserSavings(address user) public view onlyOwner returns (uint256) {
        return balance[user];
    }

    // 🟢 Users can withdraw their own ETH
    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");
        require(balance[msg.sender] >= _amount, "Insufficient balance");

        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    // 🔐 Admin can force-withdraw a user's funds to their own address
    function adminWithdrawFromUser(address user, uint256 _amount) public onlyOwner {
        require(_amount > 0, "Amount must be greater than zero");
        require(balance[user] >= _amount, "User has insufficient balance");

        balance[user] -= _amount;
        payable(owner).transfer(_amount);
    }
}
// ---------------------------------------------------------------------------------