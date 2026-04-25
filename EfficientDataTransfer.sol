// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EfficientDataTransfer {
    
    // Task 1: The ultra-efficient "Read-Only" way
    // Using 'external' and 'calldata' tells Solidity: 
    // "Don't copy this data, just read it directly from the transaction."
    function echoData(string calldata data) external pure returns (string memory) {
        return data;
    }

    // Task 2: The standard "Copy" way
    // Using 'public' and 'memory' forces Solidity to create a copy 
    // of the string in memory, which uses more gas.
    function memoryData(string memory data) public pure returns (string memory) {
        return data;
    }
}