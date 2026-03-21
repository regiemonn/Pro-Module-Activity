// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkeLedger {
    // 1. STATE VARIABLES: Representing the core data
    string public vendorName;
    uint256 public totalSales;
    bool public transactionStatus;

    // 2. MAPPING: Linking wallet addresses to specific sales amounts
    // Think of this as a digital directory: Address -> Sales Amount
    mapping(address => uint256) public vendorSales;

    /**
     * @dev Records a sale, updates the vendor name, and increments total sales.
     */
    function recordSale(
        address _vendor,
        string memory _vendorName,
        uint256 _saleAmount
    ) public {
        // Update the vendor's name in the contract
        vendorName = _vendorName;

        // Increment the global total sales
        totalSales += _saleAmount;

        // Update the mapping: adds the sale amount to that specific vendor's address
        vendorSales[_vendor] += _saleAmount;

        // Set status to true after successful execution
        transactionStatus = true;
    }

    /**
     * @dev Checks if the last transaction was successful.
     */
    function isTransactionSuccessful() public view returns (bool) {
        return transactionStatus;
    }
}