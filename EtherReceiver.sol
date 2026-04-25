// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherReceiver {
    // 1. Declare the event to keep a public "receipt" of every payment
    // Using 'indexed' allows people to search for payments by address
    event PaymentReceived(address indexed from, uint256 amount);

    // 2. The Payable Function: The "Gateway" for money
    // The 'payable' keyword is the magic switch that lets this function accept ETH
    function receivePayment() public payable {
        // We ensure someone isn't sending "zero" money
        require(msg.value > 0, "You must send some Ether!");

        // 3. Emit the event so the vendor sees the payment instantly
        emit PaymentReceived(msg.sender, msg.value);
    }

    // 4. Check the "Vault": How much is inside the contract right now?
    function getBalance() public view returns (uint256) {
        // 'address(this)' refers to the contract's own address on the blockchain
        return address(this).balance;
    }
}