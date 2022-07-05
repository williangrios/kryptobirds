//este arquivo eu criei na mão, copiei o código do 1_inicial_migrations e alterei o require


//exportando o deploymento do migrations

//cada arquivo nesta pasta faz a migração de um contrato
//aqui faz a migração do contrato IERC165 

const ERC165 = artifacts.require("ERC165");

module.exports = function (deployer) {
  deployer.deploy(ERC165);
};
