// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


//caso haja problema ao herdar uma interface (overload entre as funções), pode-se utilizar a marcação OVERRIDE


interface IERC165{

    function supportsInterface (bytes4 interfaceId) external view returns (bool);

    function _registerInterface (bytes4 interfaceId) external;

}
