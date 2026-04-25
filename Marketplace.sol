// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. THE BLUEPRINT: The Interface
// It only lists what functions SHOULD exist. No code inside!
interface ITransaction {
    function deposit(uint256 amount) external payable;
    function withdraw(uint256 amount) external;
    function checkBalance() external view returns (uint256);
}

// 2. THE IMPLEMENTATION: The Marketplace
contract Marketplace is ITransaction {
    // We use a mapping to keep track of individual "bank accounts"
    mapping(address => uint256) private balances;

    // Users send ETH here to top up their marketplace credit
    function deposit(uint256 amount) external payable override {
        // Security check: Did they actually send what they said they would?
        require(msg.value == amount, "Amount does not match sent Ether");

        balances[msg.sender] += amount;
    }

    // Users take their ETH back out
    function withdraw(uint256 amount) external override {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Update balance BEFORE sending to prevent "Reentrancy" attacks (Hackana's favorite)
        balances[msg.sender] -= amount;
        
        // Actually move the physical Ether to the user's wallet
        payable(msg.sender).transfer(amount);
    }

    // Check how much is in the user's specific "wallet" in this contract
    function checkBalance() external view override returns (uint256) {
        return balances[msg.sender];
    }
}