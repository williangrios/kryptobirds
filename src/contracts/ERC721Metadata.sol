// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "./interfaces/IERC721Metadata.sol";
import "./ERC721.sol";

contract ERC721Metadata is ERC165 , IERC721Metadata {

    string private _name;
    //como é privada coloca-se _

    string private _symbol;

    constructor (string memory named, string memory symbolified){
        _registerInterface(bytes4( keccak256('name(bytes4)') ^ keccak256('symbol(bytes4)')));

        _name = named;
        _symbol = symbolified;
    }

    function name () external view returns (string memory) {
        return _name;
    }

    function symbol () external view returns (string memory) {
        return _symbol;
    }

}