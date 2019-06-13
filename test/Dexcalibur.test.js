/* eslint-env node, mocha */
/* global artifacts, contract, it, assert */

const Dexcalibur = artifacts.require('Dexcalibur');

let instance;

contract('Dexcalibur', (accounts) => {
  it('Should deploy an instance of the Dexcalibur contract', () => Dexcalibur.deployed()
    .then((contractInstance) => {
      instance = contractInstance;
    }));

  it('Should set the number', () => instance.setNumber(2, {
    from: accounts[0],
  }));

  it('Should get the number', () => instance.getNumber()
    .then((number) => {
      assert.equal(number.toNumber(), 2, 'Number is wrong!');
    }));
});
