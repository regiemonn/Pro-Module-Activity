// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureFund {
    // Variables Defined
    address public owner; 
    uint256 public totalDonations; 

    // The constructor sets the owner dynamically during contract deployment
    constructor() {
        owner = msg.sender;
    }

    // Task 1: Define the modifier
    // This ensures only the owner can call specific functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _; 
    }

    // Function to accept Ether donations
    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");
        totalDonations += msg.value;
    }

    // Task 2: Apply the onlyOwner modifier to the withdraw function
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance); 
    }
}
