// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionTracker {
    // State variables to hold our "evidence"
    address public caller;
    uint256 public transactionTime;

    // This function acts like a security camera snapshot
    function updateTransaction() public {
        // 1. msg.sender = The "Who" (The wallet address calling this function)
        caller = msg.sender;

        // 2. block.timestamp = The "When" (The Unix time of the current block)
        transactionTime = block.timestamp;
    }
}