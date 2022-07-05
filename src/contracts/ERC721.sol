// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

//ERC721Metadata e ERC271Connector são extensões deste arquivo

import './interfaces/IERC721.sol';
import './ERC165.sol';

contract ERC721  is IERC721, ERC165 {

    event Transfer (address indexed from,
                        address indexed to,
                        uint tokenId);

    event Approval (address from, 
                        address to,
                        uint tokenId);

    constructor () {
        // o constructor tem que utiilzar o registerinterface para gerar uma assinatura gerando código tipo bytes4 que irá checar se as duas
        //funcoes foram implementadas (faz isso através de algoritmo de criptografia keccak). 
        _registerInterface( bytes4( keccak256('balanceOf(bytes4)') ^
             keccak256('ownerOf(bytes4)') ^
             keccak256('transferFrom(bytes4)') ^
             keccak256('approve(bytes4)') ) );
    }


    mapping(uint => address) private _tokenOwner;
    mapping (address => uint ) private _OwnedTokensCount;
    mapping (uint256 => address ) private _tokenApprovals;
    

    function _exists (uint tokenId) internal view returns (bool){
        address owner = _tokenOwner[tokenId];

        return owner !=address(0);

    }

    function balanceOf (address _owner) external view returns (uint){
        require(_owner != address(0), "Invalid address");
        return _OwnedTokensCount[_owner];
    }

    function ownerOf (uint _tokenId) public view returns (address){
        address owner = _tokenOwner[_tokenId];
        require (owner != address (0), "Owner query for non-exist token");
        return owner;
    }

    
    function _mint (address to, uint tokenId) internal virtual {
        require (to != address(0), "ERC 721: minting to the zero address --- Address not valid!");
        require (!_exists(tokenId), "ERC 721: Token already minted --- O token ja foi mintado");
        _tokenOwner[tokenId] = to;
        _OwnedTokensCount[to]  +=1;
        emit Transfer(address(0), to, tokenId);
    }

    function _transferFrom (address _from, address _to, uint256 _tokenId) internal  {
        require (ownerOf(_tokenId) == _from, "It isnt owner of NFT");
        require (_to != address(0), "Invalid address");
        _OwnedTokensCount[_from] -= 1;
        _OwnedTokensCount[_to] += 1;
        _tokenOwner[_tokenId] = _to;

        emit Transfer(_from, _to, _tokenId);

    }

    function transferFrom (address _from, address _to, uint256 _tokenId) public  {
        _transferFrom(_from, _to, _tokenId);
    }
    
    function approve(address _to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require (_to != owner, "Error - approval current owner");
        require (owner == msg.sender, "Not owner NFT");
        //require (_to != address(0), "Address not valid");
        
        _tokenApprovals[tokenId] = _to;

        emit Approval(owner, _to, tokenId);
        

    }

}