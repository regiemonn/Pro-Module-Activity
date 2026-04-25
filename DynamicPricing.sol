// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicPricing {
    /**
     * @dev Calculates dynamic pricing for a ride.
     * @param basePrice The base price (e.g., 100 PHP).
     * @param demandFactor Percentage increase for high demand (e.g., 20 for +20%).
     * @param timeFactor Percentage increase for specific times (e.g., 10 for +10%).
     * @return The dynamically calculated ride price.
     */
    function calculatePrice(
        uint256 basePrice,
        uint256 demandFactor,
        uint256 timeFactor
    ) public pure returns (uint256) {
        // Step 1: Apply demandFactor (e.g., 100 + 20% = 120)
        uint256 demandAdjustment = (basePrice * demandFactor) / 100;
        uint256 tempPrice = basePrice + demandAdjustment;

        // Step 2: Apply timeFactor on top of the new price (e.g., 120 + 10% = 132)
        uint256 timeAdjustment = (tempPrice * timeFactor) / 100;
        uint256 finalPrice = tempPrice + timeAdjustment;

        return finalPrice;
    }
}