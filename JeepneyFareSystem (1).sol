// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JeepneyFareSystem {
    // Mapping to track if an address has paid [cite: 55]
    mapping(address => bool) public hasPaid;

    // The starting fare for the trip [cite: 56]
    uint256 public baseFare = 13;

    // Public View: Calculates fare based on distance (13 + 2 per km) [cite: 67, 68]
    function calculateFare(uint256 distance) public view returns (uint256) {
        return baseFare + (distance * 2);
    }

    // Payable: Accepts exact Ether payment and marks passenger as paid [cite: 70, 71, 72, 73]
    function payFare(uint256 distance) public payable {
        uint256 requiredFare = calculateFare(distance);
        require(msg.value == requiredFare, "Incorrect fare amount.");
        hasPaid[msg.sender] = true;
    }

    // View: Checks if a specific passenger address has paid [cite: 76, 77]
    function checkPaymentStatus(address passenger) public view returns (bool) {
        return hasPaid[passenger];
    }

    // Private: Internal logic to verify if an amount matches the distance [cite: 80, 83, 84]
    function verifyFare(uint256 distance, uint256 paidAmount) private view returns (bool) {
        return paidAmount == calculateFare(distance);
    }
}
