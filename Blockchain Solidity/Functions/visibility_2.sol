// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Visibility Levels:
- private: only inside the same contract
- internal: inside the same contract + derived (child) contracts
- public: anywhere (internally & externally)
- external: only externally (not from same contract directly)
*/

contract Base {
    string private privateMessage = "Private: Only inside Base";
    string internal internalMessage = "Internal: Base + Child";
    string public publicMessage = "Public: Visible everywhere";

    // Private function: only inside Base
    function getPrivate() private view returns(string memory) {
        return privateMessage;
    }

    // Internal function: Base + child
    function getInternal() internal view returns(string memory) {
        return internalMessage;
    }

    // Public function: accessible from anywhere
    function getPublic() public view returns(string memory) {
        return publicMessage;
    }

    // External function: accessible only externally
    function getExternal() external pure returns(string memory) {
        return "External: Only external call works";
    }

    // ✅ Demonstrating internal usage in Base contract
    function testBaseAccess() public view returns(
        string memory,
        string memory,
        string memory
    ) {
        string memory a = getPrivate();  // ✅ Allowed
        string memory b = getInternal(); // ✅ Allowed
        string memory c = getPublic();   // ✅ Allowed
        // string memory d = getExternal(); ❌ Not allowed directly
        return (a, b, c);
    }
}

contract Child is Base {
    // ✅ Access internal and public from Base
    function testChildAccess() public view returns(
        string memory,
        string memory
    ) {
        // string memory a = getPrivate(); ❌ Not allowed
        string memory b = getInternal(); // ✅ Allowed (internal)
        string memory c = getPublic();   // ✅ Allowed (public)
        return (b, c);
    }

    // Try calling external function from child
    function callExternalFromChild() public view returns(string memory) {
        // we must make an instance of Base to call external
        Base base = Base(address(this));
        return base.getExternal(); // ✅ Correct way to call external function

        // return Base(address(this)).getExternal();
        // we can also call explictly like this 
    }
}
