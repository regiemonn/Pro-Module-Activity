// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. IMPORT: The Gold Standard of Security
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

// 2. INHERITANCE: Combining the "Manager" (Ownable) and the "Bouncer" (ReentrancyGuard)
contract SecureDonation is Ownable, ReentrancyGuard {
    uint256 public totalDonations;
    mapping(address => uint256) public donations;

    // Passing msg.sender to Ownable so Neri is the Boss
    constructor() Ownable(msg.sender) {}

    // 3. SECURE DONATE: Validating Input
    function donate() external payable nonReentrant {
        // [CHECK] Validate input: No "empty" donations allowed
        require(msg.value > 0, "Donation must be greater than zero.");
        
        // [EFFECT] Update state BEFORE any external movement
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
    }

    // 4. SECURE WITHDRAW: The Owner's Vault
    // Only the owner can call this, and they can't "re-enter" mid-execution
    function withdraw() external onlyOwner nonReentrant {
        uint256 balance = address(this).balance;

        // [CHECK] Is there actually money to take?
        require(balance > 0, "No funds to withdraw.");

        // [EFFECT] Reset the counter before the transfer happens
        totalDonations = 0;

        // [INTERACTION] Send the ETH to the owner
        // Using .call is the current recommended way for BSIT/Solidity professionals
        (bool success, ) = owner().call{value: balance}("");
        require(success, "Withdrawal failed.");
    }
}