//este arquivo eu criei na mão, copiei o código do 1_inicial_migrations e alterei o require


//exportando o deploymento do migrations

//cada arquivo nesta pasta faz a migração de um contrato
//aqui faz a migração do contrato kryptobirdz

const KryptoBirdz = artifacts.require("KryptoBirdz");

module.exports = function (deployer) {
  deployer.deploy(KryptoBirdz);
};
