/* eslint-env node, mocha */
/* global artifacts, contract, it, assert, web3 */

const Dexcalibur = artifacts.require('Dexcalibur');

let instance;

contract('Dexcalibur', (accounts) => {
  it('Should deploy an instance of the Dexcalibur contract', () => Dexcalibur.deployed()
    .then((contractInstance) => {
      instance = contractInstance;
    }));

  it('Should check if account 0 is the king', () => instance.amITheKing({
    from: accounts[0],
    value: web3.utils.toWei('0.01'),
  }));
});
