/* eslint-env node, mocha */
/* global artifacts, contract, it, assert, web3 */

const TestToken = artifacts.require('TestToken');
const Dexcalibur = artifacts.require('Dexcalibur');

let instance;
let token;

contract('Dexcalibur', (accounts) => {
  it('Should deploy an instance of the TestToken contract', () => TestToken.deployed()
    .then((contractInstance) => {
      token = contractInstance;
    }));

  it('Should deploy an instance of the Dexcalibur contract', () => Dexcalibur.deployed(token.address)
    .then((contractInstance) => {
      instance = contractInstance;
    }));

  it('Should check the balance of account 0', () => token.balanceOf(accounts[0])
    .then((balance) => {
      assert.equal(balance.toString(), web3.utils.toWei('42'), 'Account 0 balance is wrong');
    }));

  it('Should try to submit an answer', () => instance.submitAnswer(0, 1, 2, {
    from: accounts[0],
    value: web3.utils.toWei('0.01'),
  }));

  it('Should check if the game is still open', () => instance.isGameOpen()
    .then((res) => {
      assert.equal(res, false, 'Game should be closed');
    }));
});
