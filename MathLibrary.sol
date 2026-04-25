// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Define the Library (The Toolbox)
// Libraries are stateless—they can't store money or data, just logic.
library MathLibrary {
    function calculatePercentage(
        uint256 base, 
        uint256 percent
    ) internal pure returns (uint256) {
        // Safe math: multiply first, then divide to keep precision
        return (base * percent) / 100;
    }
}

// 2. The Main Defense Contract
contract HackanaDefense {
    string public city = "San Juan City";

    // Task: Use the library to calculate transaction fees
    function calculateFee(
        uint256 transactionAmount,
        uint256 feePercent
    ) public pure returns (uint256) {
        // We call the library using LibraryName.FunctionName
        return MathLibrary.calculatePercentage(transactionAmount, feePercent);
    }
}