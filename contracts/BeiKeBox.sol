// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract BeiKeBox is ERC1155 {

    address owner;
    uint mint_id = 0;

    constructor() ERC1155("") {
        owner = msg.sender;
    }

    mapping (uint=>address) ownerMapping;
    mapping (uint=>uint) priceMapping;

    modifier onlyOwner() {
        require(msg.sender == owner, "Operation is not premitted.");
        _;
    }

    modifier shouldMinted(uint id){
        require(ownerMapping[id] != address(0), "Specific ID is not minted.");
        _;
    }

    function mint(address producer, uint amount) public onlyOwner() returns (uint) {
        _mint(producer, mint_id, amount, "");
        ownerMapping[mint_id] = producer;
        setApprovalForAll(producer, true);
        mint_id += 1;
        return mint_id;
    }

    function setPrice(uint id, uint price) public onlyOwner() shouldMinted(id) {
        priceMapping[id] = price;
    }

    function purchase(uint id) public payable shouldMinted(id) {
        require(msg.value >= priceMapping[id]);
        address producer = ownerMapping[id];

        _safeTransferFrom(producer, msg.sender, id, 1, "");
        payable(producer).transfer(priceMapping[id]);
    }

    function getPrice(uint id) public view shouldMinted(id) returns (uint) {
        return priceMapping[id];
    }
}