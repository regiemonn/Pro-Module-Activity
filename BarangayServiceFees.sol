// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayServiceFees {
    // State variable - this is stored on the blockchain "disk"
    uint256 public certificationFee = 100;

    // 1. View Function: Reads the "listahan" (the state)
    // It looks at 'certificationFee' but doesn't change it.
    function getCertificationFee() public view returns (uint256) {
        return certificationFee;
    }

    // 2. Pure Function: A "Calculator" mode
    // It doesn't even look at the 'certificationFee' variable!
    // It only uses the numbers you give it (numberOfCertifications).
    function calculateTotalCost(
        uint256 numberOfCertifications
    ) public pure returns (uint256) {
        // We use 100 here as a constant math value
        return numberOfCertifications * 100;
    }
}