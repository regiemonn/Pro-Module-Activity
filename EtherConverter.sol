// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherConverter {

    // 1. Convert Ether to Wei (The Multiplication)
    // 1 Ether = 1,000,000,000,000,000,000 Wei
    function etherToWei(uint256 etherAmount) public pure returns (uint256) {
        // Solidity recognizes the 'ether' keyword as 10^18
        return etherAmount * 1 ether;
    }

    // 2. Convert Wei to Ether (The Division)
    // Note: If you send 500 Wei here, it will return 0 because Solidity 
    // rounds down for integers!
    function weiToEther(uint256 weiAmount) public pure returns (uint256) {
        return weiAmount / 1 ether;
    }
}