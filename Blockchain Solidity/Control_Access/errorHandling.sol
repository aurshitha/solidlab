// --------------------------------------------------------
// REQUIRE: used to check inputs and conditions. provide error message. 

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract error_Handling {
    address public user;

    function deposit(uint _amount) public {
          // validates inputs and conditions. it refunds the gas.
          require(_amount > 0, "Amount should be greater than zero");
          balance += _amount;
    }

    function withdraw(uint _amount) public {
          require(_amount <= balance, "Insufficient balance");
          balance -= _amount;
    }
}

// -----------------------------------------------------------
// REVERT: used to revert a transaction manually with a message. Explicity reverts with message.

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract error_Handling {
    address public user;

    function deposit(uint _amount) public {
         // revert is used to manually trigger an error. 
        // it checks the condition if something went wrong and it stops, returns the gas.
          if (_amount <= 0) {
                revert("Deposit amount must be greater than zero");
          }
            balance += _amount;
    }

    function withdraw(uint _amount) public {
          if (_amount > balance) {
                revert("Insufficient balance");
          }
          balance -= _amount;
    }
}

// -----------------------------------------------------------
// ASSERT: Used to check internal errors (should never fail) or invariants or critical errors in code logic.
// detects internal bugs; no refund.

// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract error_Handling {
    address public user;

    function deposit(uint _amount) public {
         // assert is used to check for conditions that should always true. 
        // it doesn't returns the gas.
            balance += _amount;
            assert (balance >= amount);
    }

    function withdraw(uint _amount) public {
          balance -= _amount;
          assert(balance >= 0);
    }
}

