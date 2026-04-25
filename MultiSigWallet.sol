// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[] public signers;
    uint256 public approvalThreshold;

    struct Transaction {
        address to;
        uint256 value;
        uint256 approvals;
        bool executed;
    }

    Transaction[] public transactions;
    mapping(address => bool) public isSigner;
    // Tracks: txId => signerAddress => hasApproved?
    mapping(uint256 => mapping(address => bool)) public approved;

    constructor(address[] memory _signers, uint256 _threshold) {
        require(_signers.length > 0, "Signers required");
        require(_threshold > 0 && _threshold <= _signers.length, "Invalid threshold");

        for (uint256 i = 0; i < _signers.length; i++) {
            address signer = _signers[i];
            require(signer != address(0), "Invalid signer");
            require(!isSigner[signer], "Signer not unique");

            isSigner[signer] = true;
            signers.push(signer);
        }
        approvalThreshold = _threshold;
    }

    // Task 1: Propose a new expenditure for the city
    function proposeTransaction(address _to, uint256 _value) public {
        require(isSigner[msg.sender], "Not authorized");
        
        transactions.push(Transaction({
            to: _to,
            value: _value,
            approvals: 0,
            executed: false
        }));
    }

    // Task 2: Cast a vote for a specific transaction
    function approveTransaction(uint256 txId) public {
        require(isSigner[msg.sender], "Not authorized");
        require(txId < transactions.length, "Tx does not exist");
        require(!approved[txId][msg.sender], "Already approved");
        require(!transactions[txId].executed, "Already executed");

        approved[txId][msg.sender] = true;
        transactions[txId].approvals++;
    }

    // Task 3: Finalize and send funds if consensus is reached
    function executeTransaction(uint256 txId) public {
        require(txId < transactions.length, "Tx does not exist");
        
        Transaction storage txn = transactions[txId];
        
        require(!txn.executed, "Already executed");
        require(txn.approvals >= approvalThreshold, "Not enough approvals");

        txn.executed = true; // Mark as executed BEFORE the call (Reentrancy protection!)
        
        (bool success, ) = txn.to.call{value: txn.value}("");
        require(success, "Transaction failed");
    }

    // Receive funds from city taxes or donations
    receive() external payable {}
}