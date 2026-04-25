// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomerRegistry {

    // 1. Define the struct to group related customer data
    struct Customer {
        string name;
        address walletAddress;
        uint256 balance;
    }

    // 2. Create a mapping to store these structs by their address
    mapping(address => Customer) public customers;

    // 3. Function to add a new customer to the registry
    function addCustomer(string memory _name, uint256 _balance) public {
        // We use msg.sender to ensure the record is tied to the person calling the function
        customers[msg.sender] = Customer({
            name: _name,
            walletAddress: msg.sender,
            balance: _balance
        });
    }

    // 4. Function to retrieve details for a specific address
    function getCustomer(address _walletAddress) 
        public 
        view 
        returns (string memory, address, uint256) 
    {
        // Fetch the struct from storage into memory for the return statement
        Customer memory c = customers[_walletAddress];
        return (c.name, c.walletAddress, c.balance);
    }
}