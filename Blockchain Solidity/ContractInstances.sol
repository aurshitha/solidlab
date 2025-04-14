//SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

// Different Ways to create or Use contract Instances:-

// 1. Using "new" keyword (creates a new instance) 
Sample1 s = new Sample1();
//  This creates a new deployment of the Sample1 contract on the blockchain.


// 2. Using address of deployed contract (if it's already deployed) 
Sample1 s = Sample1(address(0x...));


// 3. Using constructor dependency Injection

contract Sample {
    Sample1 public s;

    constructor(address _sample1Address) {
        s = Sample1(_sample1Address);
    }
}
// good practice for large applications and avoids re-deployment.