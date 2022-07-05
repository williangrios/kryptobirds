// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import './interfaces/IERC165.sol';

// em uma herança, precisamos implementar o método da interface, caso contrário precisariamos declarar 'abstract' no contrato
contract ERC165 is IERC165 {

    constructor () {
        // o constructor tem que utiilzar o registerinterface para gerar uma assinatura gerando código tipo bytes4 que irá checar se as duas
        //funcoes foram implementadas (faz isso através de algoritmo de criptografia keccak). 
        _registerInterface( bytes4( keccak256('supportsInterface(bytes4)') ^ keccak256('_registerInterface(bytes4)')));
    }

    mapping (bytes4 => bool) public _suportedInterfaces;

    function supportsInterface (bytes4 interfaceId) external  view returns (bool){
        return _suportedInterfaces[interfaceId];
    }

    //0xffffffff é como se fosse um endereço zero
    function _registerInterface (bytes4 interfaceId) public {
        require (interfaceId != 0xffffffff, "ERC165: Invalid Interface");
        _suportedInterfaces[interfaceId] = true;
    }

}