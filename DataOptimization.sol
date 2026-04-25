// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataOptimization {
    // 1. STORAGE: This lives on the blockchain forever (Expensive to change)
    string public storedMessage = "Stored permanently";

    // 2. Function using MEMORY for the input
    // The 'tempMessage' only exists while this function is running.
    function updateMessage(string memory tempMessage) public {
        // We only write to 'storage' once at the end to save gas
        storedMessage = tempMessage;
    }

    // 3. Comparing the two
    function compareStorageAndMemory() public view returns (string memory) {
        // We copy the permanent 'storage' data into a 'memory' Post-it note
        string memory tempMessage = storedMessage;
        
        // We return the Post-it note version
        return tempMessage;
    }
}