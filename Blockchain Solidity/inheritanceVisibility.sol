// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// Visibility     // accessible in child contract ?   // accessible in parent ?
// internal             yes                               yes
// private              no                                yes
// public               yes                               yes
// external             yes (but only via this)           yes

// Parent contract
contract ParentContract {
    string private secert = "I am private";
    string internal family = "I am internal";

    string public publicVar = "I am public";

    function getSecret() private pure returns(string memory) {
        return "secert from parent";
    }

    function getFamily() internal pure returns(string memory) {
        return "Family from parent";
    }

    function testParentAccess() public pure returns(string memory) {
        return getSecret(); // works within the same contract
    }

    function testParentInternalAccess() public pure returns(string memory) {
        return getFamily(); // works within the same contract
    }
}

// Child contract
contract ChildContract is ParentContract {
    function callInternalFromChild() public pure returns(string memory) {
        return getFamily();
    }

    function callPrivateFromParent() public pure returns(string memory) {
        // return getSecret();
        return testParentAccess();
    }
}


// private funtion cannot be called outside the contract of parent
// but can be accessed - we can call the function in the child contract 
//  of the parent in which the private is being called.

// internal - it is reusable logic you want children to inherit 
// use private for secret stuff that no child should know
