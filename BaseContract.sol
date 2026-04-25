// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. The Parent (Base) Contract: Shared "DNA" for all projects
contract BaseContract {
    string public organizationName;

    // Task 1: Validation to ensure the name isn't blank
    function setOrganizationName(string memory name) public {
        // Converting string to bytes to check length (standard Solidity trick)
        require(bytes(name).length > 0, "Name cannot be empty");
        organizationName = name;
    }
}

// 2. The Child (Derived) Contract: Inherits everything from Base
// The 'is' keyword creates the family connection
contract DerivedContract is BaseContract {
    uint256 public fundBalance;

    // Task 2: New feature unique to the child
    function depositFunds(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        fundBalance += amount;
    }
}