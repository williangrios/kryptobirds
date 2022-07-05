// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "./ERC721.sol";
import "./interfaces/IERC721Enumerable.sol";
import "./ERC165.sol";

contract ERC721Enumerable is ERC721, IERC721Enumerable {
    
    uint256[] private _allTokens;

    //mapping relacionando o seu tokenId com o seu index
    mapping (uint256 => uint256) private _allTokensIndex;

    //dono relacionado a uma lista de tokens que ele é proprietário
    mapping (address => uint256[]) private _ownedTokens;

    //mapping registrar o index do alltokens com seu respectivo dono
    mapping (uint256 => uint256) private _ownedTokensIndex;

    constructor () {
        _registerInterface(bytes4( keccak256('totalSupply(bytes4)') ^
                            keccak256('tokenByIndex(bytes4)') ^
                            keccak256('tokenOfOwnerByIndex(bytes4)')));
    }

    //como possui a mesma assinatura do ERC721 (que herda), precisamos sobrescrever com override
    function _mint (address to, uint256 tokenId) internal override (ERC721){
        super._mint(to, tokenId);
        _addTokensToAllTokensEnumerations(tokenId);
        _addTokensToOwnerEnumeration(to, tokenId);
    }

    function totalSupply() public view returns (uint256)
    {
        return _allTokens.length;
    }

    function _addTokensToAllTokensEnumerations(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }


    /// estas duas não estão lá na documentação/site do ERC721
    function tokenByIndex(uint256 index) public view returns (uint256){
        require (index < totalSupply(), "Global index is out of bound");
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex (address to, uint256 index) public view returns (uint256) {
        //require (index  < balanceOf(to) , 'Global index is out of bound');
        return _ownedTokens[to][index];
    }



}