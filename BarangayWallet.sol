// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWallet {
    // 1. State variable to track total funds received
    uint256 public totalReceived;

    // 2. Event to log "weird" or invalid interactions
    event InvalidCall(address sender, uint256 value, bytes data);

    // 3. Receive Function: The "Direct Deposit" slot
    // Triggered when someone sends ETH with NO data (plain transfer)
    receive() external payable {
        totalReceived += msg.value;
    }

    // 4. Fallback Function: The "Safety Net"
    // Triggered when someone calls a function that doesn't exist 
    // or sends ETH with data that doesn't match anything.
    fallback() external payable {
        emit InvalidCall(msg.sender, msg.value, msg.data);
    }
}