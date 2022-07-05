//exportando o deploymento do migrations


//cada arquivo nesta pasta faz a migração de um contrato
//aqui faz a migração do contrato migrations

const Migrations = artifacts.require("Migrations");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
