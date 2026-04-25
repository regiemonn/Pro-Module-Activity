// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFund {
    uint256 public totalFunds;

    // 1. Declare the Event (The "Announcement" template)
    // We record the new total and the address of the person who deposited.
    event FundUpdated(uint256 newAmount, address updatedBy);

    // 2. Function to update funds and trigger the announcement
    function depositFunds(uint256 amount) public {
        // Validation: Ensure the barangay isn't receiving "zero" or "negative" (which isn't possible with uint)
        require(amount > 0, "Deposit amount must be greater than zero.");
        
        // Update the state variable
        totalFunds += amount;

        // 3. Emit the event to the blockchain logs
        emit FundUpdated(totalFunds, msg.sender);
    }
}