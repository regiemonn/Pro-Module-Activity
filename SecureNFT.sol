// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Task 1: Import OpenZeppelin standard contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SecureNFT is ERC721URIStorage, Ownable {
    uint256 public totalSupply;
    uint256 public maxSupply = 100;

    // The constructor passes the name and symbol to ERC721 
    // and sets the deployer (msg.sender) as the initial Owner
    constructor() ERC721("SanJuanNFT", "SJN") Ownable(msg.sender) {}

    // Task 2: Implement secure minting logic
    function mintNFT(address recipient, string memory tokenURI) public onlyOwner {
        // Ensure we haven't hit the ceiling set by the San Juan Digital Renaissance
        require(totalSupply < maxSupply, "Max NFT supply reached");

        // Increment supply FIRST to use it as the unique Token ID
        totalSupply++;
        uint256 newItemId = totalSupply;

        // Internal OpenZeppelin functions to handle the heavy lifting
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
    }
}