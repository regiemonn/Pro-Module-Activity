// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityFund {
    address public fundOwner;
    uint256 public totalDonations;

    constructor() {
        // Sets the person who deploys the contract as the owner [cite: 24, 25]
        fundOwner = msg.sender;
    }

    // Function to allow users to donate securely [cite: 9, 10]
    function donate(uint256 amount) public payable {
        // Task: Ensure donations are non-zero [cite: 38, 39]
        require(amount > 0, "Donation must be greater than zero"); // [cite: 40]

        // Task: Ensure msg.value matches the donation amount [cite: 41, 42, 43]
        require(msg.value == amount, "Insufficient Ether provided"); // [cite: 44]

        totalDonations += amount; // [cite: 28]
    }

    // Function to allow the owner to withdraw funds [cite: 30]
    function withdraw(uint256 amount) public {
        // Task: Only the fundOwner can withdraw funds [cite: 45, 46]
        require(msg.sender == fundOwner, "Only the owner can withdraw funds"); // [cite: 47]

        // Task: Verify enough funds exist before allowing withdrawal [cite: 48, 49, 50]
        require(amount <= totalDonations, "Not enough funds"); // [cite: 51]

        totalDonations -= amount; // [cite: 31]
        payable(fundOwner).transfer(amount); // [cite: 32]
    }
}
