// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC721, Ownable {
    struct Object {
        string name;
        uint32 weight;
    }

    Object[] public objects; // accessible publiquement

    mapping(uint256 => address) public objectToOwner;
    mapping(address => uint256) ownerObjectCount;

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {}

    function createObjet(string memory name) public {
        Object memory objectCreated = Object(name, 20);
        objects.push(objectCreated);

        uint256 id = objects.length - 1;
        objectToOwner[id] = msg.sender;

        ownerObjectCount[msg.sender] += 1;
    }
}
