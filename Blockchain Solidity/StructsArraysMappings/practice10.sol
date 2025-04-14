// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 2. Simple Marketplace
// 🔧 Covers:
// Structs, Mappings, Arrays
// 📝 Problem:
// Build a simple product listing contract:
// addProduct(string _name, uint _price) → anyone can list a product
// getProduct(uint _id) → view details of product
// buyProduct(uint _id) → buyer sends ETH to purchase
// Use:
// Struct for Product
// Mapping uint => Product for lookup
// Track purchases using mapping(address => uint[])

