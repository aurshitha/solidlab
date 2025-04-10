// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
contract VisibilityExample {
    uint private x = 10;
    uint internal y = 20;
    uint public  z = 30;

    function privateFun() private pure returns(string memory) {
        return "Private";
    }

    function internalFun() internal pure returns(string memory) {
        return "internal";
    }

    function externalFun() external pure returns(string memory) {
        return "external";
    }

    function publicFun() public pure returns(string memory) {
        return "public";
    }

    function testInsideCalls() public view returns(string memory) {
        // can calll all expect external directly
        privateFun();
        internalFun();
        publicFun();
        // cannot call external directly
        // externalFun(); -> gives an compiler error
        this.externalFunc();
        return "Sucess";
    }
}