// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Task 1: Import the shield against recursive calls
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract PalengkeWallet is ReentrancyGuard {
    mapping(address => uint256) public balances;

    // Task 2: Secure the withdraw function
    function withdraw(uint256 amount) public nonReentrant {
        
        // 1. CHECKS: Verify the user actually has the funds
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // 2. EFFECTS: Update the state BEFORE the external call
        // Even if they try to call back, their balance is already 0 here!
        balances[msg.sender] -= amount;

        // 3. INTERACTIONS: Send the digital PHP (ETH/Tokens)
        (bool success, ) = msg.sender.call{value: amount}("");
        
        // Ensure the transfer actually went through
        require(success, "Transfer failed");
    }

    // Allow vendors to deposit their daily earnings
    receive() external payable {
        balances[msg.sender] += msg.value;
    }
}