// SPDX-License-Identifier: MIT
//pragma solidity ^0.5.0;
pragma solidity 0.8.15;

import "./ERC721Connector.sol";

contract KryptoBirdz is ERC721Connector{

    string[] public kryptoBird;
    mapping(string => bool) private _kriptoBirdExists;

    function mint (string memory _kryptobird) public payable {
        require(!_kriptoBirdExists[_kryptobird] , "Error - KriptoBird already exist");
        kryptoBird.push(_kryptobird);
        uint _id = kryptoBird.length -1;
        _mint(msg.sender, _id );
        _kriptoBirdExists[_kryptobird] = true;
    }

    constructor () ERC721Connector("KriptoBirdz", "KBIRDZ") {

    }



}