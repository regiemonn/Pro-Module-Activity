// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkeTransactions {
    
    // 1. Create a dynamic array to store payment amounts (uint256)
    uint256[] public payments;

    // 2. Function to record a payment to the array
    function recordPayment(uint256 _amount) public {
        // .push() adds the new amount to the very end of the list
        payments.push(_amount);
    }

    // 3. Function to retrieve the total number of payments made
    function getTotalPayments() public view returns (uint256) {
        // .length tells us how many items are currently in the array
        return payments.length;
    }

    // 4. Function to access a specific payment by its index (position)
    function getPayment(uint256 _index) public view returns (uint256) {
        // Validation: Ensure we don't look for an item that doesn't exist
        require(_index < payments.length, "Invalid index.");
        return payments[_index];
    }
}