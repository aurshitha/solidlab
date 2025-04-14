// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// 🧩 2. Voting System
// 🔸 Covers:
// struct, mapping, functions, visibility, basic logic
// 🔸 Problem:
// Make a contract to register candidates and allow voting.
// addCandidate(string name) → add a new candidate
// vote(uint candidateId) → 1 vote per address only
// getVotes(uint candidateId) → check votes for candidate
// 💡 Bonus: Prevent double-voting using a mapping of address => bool.

