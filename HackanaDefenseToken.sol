// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. The Professional Import
// This pulls in hundreds of lines of secure code from the internet
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 2. Inheritance
// 'is ERC20' gives Neri's contract all the standard token powers
contract HackanaDefenseToken is ERC20 {

    // 3. Constructor & Initialization
    // We pass the Name and Symbol to the parent (ERC20)
    constructor() ERC20("DefenseToken", "DEF") {
        
        // 4. The Initial Mint
        // We mint 1000 tokens. 
        // We multiply by 10^18 (decimals) because 1 Token = 1,000,000,000,000,000,000 units
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}