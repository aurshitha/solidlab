//SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;

contract Sample1{
    int public b = 78;         // 👀 Public: Can be accessed from anywhere
    int internal c = 90;       // 🔒 Internal: Only inside this contract or child contracts

    function al() external returns(int) {
        b = 21;         // ✅ You can write to b internally
        c = 9;          // ✅ Internal access is allowed here

        int temp = this.b();  // 👈 External call to public variable (via implicit getter)

        return temp;

        // ❌ You can't assign via this.b = 18
        // ❌ You can't call this.c() since 'c' is internal (no getter available)
    }

    // this.b() is allowed because b is public, and 
    // all public variables get an automatic getter function in Solidity.

}

contract Sample2{
    int internal d = 9;  // accessible inside this or child contracts
    int private e = 90;  // accessible ONLY in this contract
}

//Third contract is inheriting from Sample2
contract Sample is Sample2{
    Sample1 s; // Declares a variable of type Sample1 (an instance)

    function sample3() public returns(int){
        s = new Sample1(); // ✅ Creates a new instance of Sample1 and assigns to 's'

        int f = s.b();      // ✅ Calls public getter for 'b'
        
        d = 8;              // ✅ Allowed: 'd' is inherited and internal
        // e = 7;           // ❌ Not allowed: 'e' is private in Sample2

        return f;
    }

// You're calling a public getter from another contract.
//You can access d because it’s internal and you inherit it.
// You can’t access or modify a private variable e.
}