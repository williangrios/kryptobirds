
// SPDX-License-Identifier: MIT
//pragma solidity >=0.4.22 <0.8.0;
pragma solidity 0.8.15;

contract Migrations {
  
  address public owner = msg.sender;
  uint public last_completed_migration;

//modifica as funções, sendo que ao se colocar este modifier
//na função, somente o owner poderá utilizar a função
 
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's ownnner"
    );
    _;
  }

  //veja o modifier aqui nesta função
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted{
    Migrations upgraded = Migrations(new_address); 
    //upgrade.setCompleted(last_completed_migration);
  }

}
