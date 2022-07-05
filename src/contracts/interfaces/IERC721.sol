// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// @title ERC-721 Non-Fungible Token Standard
/// @dev See https://eips.ethereum.org/EIPS/eip-721
///  Note: the ERC-165 identifier for this interface is 0x80ac58cd.
interface IERC721  {
    
    function balanceOf(address _owner) external view returns (uint256);

   
    function ownerOf(uint256 _tokenId) external view returns (address);

   
    function transferFrom(address _from, address _to, uint256 _tokenId) external ;

    
    function approve(address _approved, uint256 _tokenId) external ;


}