// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProgram {
    // State variables to hold the program's identity
    string public programName;
    uint256 public startingBalance;

    // 1. The Constructor: Runs ONLY ONCE during deployment
    // This is where Neri "automates" the setup as requested by the official.
    constructor(string memory _programName, uint256 _startingBalance) {
        programName = _programName;
        startingBalance = _startingBalance;
    }

    // 2. Function to retrieve the initialized details
    function getProgramDetails() public view returns (string memory, uint256) {
        // Returns the data as a "tuple" (a group of values)
        return (programName, startingBalance);
    }
}