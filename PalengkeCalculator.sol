// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkeCalculator {

    uint256[] public prices;
    uint256[] public quantities;

    // Calculate total cost for a single order and store it
    function calculateTotal(
        uint256 pricePerUnit,
        uint256 quantity
    ) public returns (uint256) {

        prices.push(pricePerUnit);
        quantities.push(quantity);

        return pricePerUnit * quantity;
    }

    // Calculate customer change
    function calculateChange(
        uint256 totalCost,
        uint256 payment
    ) public pure returns (uint256) {
        require(payment >= totalCost, "Insufficient payment.");
        return payment - totalCost;
    }

    // Apply discount to total cost
    function applyDiscount(
        uint256 totalCost,
        uint256 discountPercent
    ) public pure returns (uint256) {
        require(discountPercent <= 100, "Invalid discount percentage.");
        return totalCost - ((totalCost * discountPercent) / 100);
    }

    // Split bill among group
    function splitBill(
        uint256 totalCost,
        uint256 groupSize
    ) public pure returns (uint256) {
        require(groupSize > 0, "Group size must be greater than zero.");
        return totalCost / groupSize;
    }

    // Computes total of all stored orders
    function calculateGrandTotal() public view returns (uint256) {

        uint256 total = 0;

        for (uint256 i = 0; i < prices.length; i++) {
            total += prices[i] * quantities[i];
        }

        return total;
    }
}