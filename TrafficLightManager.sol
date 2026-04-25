// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrafficLightManager {
    // Maps intersection names (e.g., "EDSA-Ortigas") to their current color
    mapping(string => string) public lightState;

    constructor() {
        // Task 1: 🚩 Initialize all intersections to "red" for safety
        lightState["intersection1"] = "red";
        lightState["intersection2"] = "red";
    }

    // Task 2: 🚩 Change the traffic light state dynamically
    function changeLight(string memory intersection, string memory newState) public {
        
        // 🏁 VALIDATION: Use hashing to compare string values safely
        require(
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("red")) ||
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("yellow")) ||
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("green")),
            "Invalid state! State must be 'red', 'green', or 'yellow'."
        );

        // 🏁 UPDATE: Apply the validated state to the specific intersection
        lightState[intersection] = newState;
    }
}