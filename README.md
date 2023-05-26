# BeiKeBox - Solidity
A decentralized application let user sell some stuff about NTUT.

## Progress

 - [x] Implement the contract. 
 - [x] Test the contract.
 - [x] CI for test the contract.
 - [ ] Deploy the contract to Goerli.

## How it works?

 - Local test environment (Ganache)
    - You should have an Ganache container for blockchain testing environment.
    - Setup the networks in `truffle-config.js`. The developements network will depend on Ganache so it should set the host of Ganache. (See `truffle-config.js`)
    - After setting the networks, you can process the operation...
        - Compile the contract: `truffle compile`
        - Test the contract: `truffle test --network=developement`
 - Goerli deployment:
    - TBD.