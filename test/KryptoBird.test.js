const {assert} = require ('chai');

//criando uma const e armazenando a classe
const KryptoBird = artifacts.require('./KryptoBirdz')


require('chai').use(require('chai-as-promised')).should();

contract('KryptoBirdz', (accounts)=> {
    let contract;

    before( async ()=>{
        contract = await KryptoBird.deployed();

    });

    describe('deployment', async () => {
        it('deploys sucessfully'), async  () => {
            const address = contract.address;
            assert.notEqual(address, '');
            assert.notEqual(address, null);
            assert.notEqual(address, undefined);
            assert.notEqual(address, '0x0000000000000000000000000000000000000000');
        } ;

        it('has a name', async() => {
            const name = await contract.name();
            assert.equal(name, 'KriptoBirdz');
        });

        it('has a symbol', async() => {
            const symbol = await contract.symbol();
            assert.equal(symbol, 'KBIRDZ');
        });
    });

    describe ('minting', async () => {
        it('creates new token', async () => {
            const result = await contract.mint('k1');
            const totalSupply = await contract.totalSupply();
            
            //sucess
            assert.equal(totalSupply , 1) ;

            const event = result.logs[0].args;
            assert.equal (event.from , "0x0000000000000000000000000000000000000000");
            assert.equal (event.to , accounts[0], "_to is the msg.sender");

            //fail
            await contract.mint('k1').should.be.rejected;

        });

    });

    describe ('indexing', async() => {
        it('lists kryptobirdz', async() => {
            await contract.mint('k2');
            await contract.mint('k3');
            await contract.mint('k4');
            
            const totalSupply = await contract.totalSupply();

            let result = [];
            let KRyptoBird;

            for (i=1;  i <= totalSupply ; i++) {
                KRyptoBird = await contract.kryptoBird(i-1);
                result.push(KRyptoBird);
            }

            let expected = ['k1', 'k2','k3','k4'];
            assert.equal(result.join(','), expected.join(','));

        });

    });

});