// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract error_Handling {
    address public user;

    function deposit(uint _amount) public {
          require(_amount > 0, "Amount should be greater than zero");
          balance += _amount;
    }

    function withdraw(uint _amount) public {
          require(_amount <= balance, "Insufficient balance");
          balance -= _amount;
    }
}
