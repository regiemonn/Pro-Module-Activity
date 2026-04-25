// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTWithRoyalties {
    address public creator;
    uint256 public royaltyPercentage; // e.g., 10 for 10%
    address public currentOwner;

    constructor(address _creator, uint256 _percentage) {
        creator = _creator;
        royaltyPercentage = _percentage;
        currentOwner = _creator;
    }

    function transferNFT(address buyer, uint256 salePrice) public payable {
        // Validation: Ensure the buyer sent exactly what the NFT costs
        require(msg.value == salePrice, "Incorrect payment amount");
        require(buyer != address(0), "Invalid buyer address");

        // 1. Calculate the artist's cut (The Royalty)
        uint256 royalty = (salePrice * royaltyPercentage) / 100;
        
        // 2. Calculate what the current seller actually gets
        uint256 sellerAmount = salePrice - royalty;

        // 3. Payouts: Send ETH to the creator and the current owner
        payable(creator).transfer(royalty);
        payable(currentOwner).transfer(sellerAmount);

        // 4. State Update: The buyer is now the new owner
        currentOwner = buyer;
    }
}