// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Allowlist {
    // create local variable to hold the maximum amount of addresses
    // to be allowlisted

    uint8 public maxAllowlistedAddresses;

    // create a mapping to check for allowlisted addresses
   mapping(address => bool) public allowlistedAddresses;

    // Use a constructor to set the max number of addresses to be allowlisted.
    constructor(uint8 _maxAllowlistedAddresses) {
        maxAllowlistedAddresses = _maxAllowlistedAddresses;
    }

    uint8 public numAllowlistedAddresses;

    //This function  adds the address of the sender to the allowlist.
    function addAddressToAllowlist() public {
        require(!allowlistedAddresses[msg.sender], "Address is already on the allowlist.");
        require(numAllowlistedAddresses < maxAllowlistedAddresses, "Limit reached, more addressed can not be added to the allowlist.");

        allowlistedAddresses[msg.sender] = true;
        numAllowlistedAddresses += 1;
    }
}


// Allowlist Contract Address: 0xBBdA79A718A369b38265D1Ca5d834a0e8fFEB0e6