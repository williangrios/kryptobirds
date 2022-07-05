// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


//este contrato é uma ponte entre o ERC721Metadata e o Kryptobirdz


//importando o contrato para herdar suas características
import './ERC721Metadata.sol';
import './ERC721Enumerable.sol';


contract ERC721Connector is ERC721Metadata, ERC721Enumerable {

    //acho que essa linha já chama o constructor do ERC721Metadata
    constructor (string memory name, string memory symbol) ERC721Metadata(name, symbol) {

    }

}