// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. IMPORT: The Multi-Token Standard and Access Control
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 2. INHERITANCE: Combining ERC1155 and Ownable
contract MultiAsset is ERC1155, Ownable {
    // We use constants to define the "IDs" of our assets
    uint256 public constant GOLD = 1;      // Fungible (Stackable)
    uint256 public constant ARTIFACT = 2;  // Non-fungible (Unique)

    // 3. CONSTRUCTOR: Setting the Metadata URI and Initial Supply
    // {id} is a placeholder that automatically fills in 1 or 2
    constructor() 
        ERC1155("https://api.bitskwela.com/metadata/{id}.json") 
        Ownable(msg.sender) 
    {
        // Initial Minting: 1000 Gold (Stackable) and 1 Artifact (Unique)
        _mint(msg.sender, GOLD, 1000, ""); 
        _mint(msg.sender, ARTIFACT, 1, ""); 
    }

    // 4. MINT FUNCTION: Allowing the owner to create more items
    // 'data' is an extra field often used for specialized logic (can be left empty)
    function mint(
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public onlyOwner {
        _mint(to, id, amount, data);
    }
}