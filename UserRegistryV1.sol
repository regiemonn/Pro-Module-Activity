// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. IMPORT: The Initializable tool from OpenZeppelin
// This replaces the "constructor" because Proxies can't call constructors
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

// --- VERSION 1: The Basic Shield ---
contract UserRegistryV1 is Initializable {
    mapping(address => string) public userNames;

    // Instead of a constructor, we use this. 
    // The "initializer" modifier ensures it can only be called ONCE.
    function initialize() public initializer {
        // Initialization logic goes here (if any)
    }

    function registerUser(string memory name) public {
        userNames[msg.sender] = name;
    }

    function getUser(address user) public view returns (string memory) {
        return userNames[user];
    }
}

// --- VERSION 2: The Adaptive Shield ---
// We inherit from V1 so we keep the exact same storage layout
contract UserRegistryV2 is UserRegistryV1 {
    
    // Task: Add the ability to update names
    function updateUser(string memory newName) public {
        // Security check: only the person who registered can update
        // (In V1, they already exist in the mapping)
        userNames[msg.sender] = newName;
    }
}