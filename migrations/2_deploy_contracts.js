/* eslint-env node */
/* global artifacts */

const TestToken = artifacts.require('TestToken');
const Dexcalibur = artifacts.require('Dexcalibur');

const manaTokenAddress = '0x2a8fd99c19271f4f04b1b7b9c4f7cf264b626edb';

function deployContracts(deployer, network) {
  if (network === 'development') {
    deployer.deploy(TestToken)
      .then(() => deployer.deploy(Dexcalibur, TestToken.address));
  } else if (network === 'ropsten') {
    deployer.deploy(Dexcalibur, manaTokenAddress);
  }
}

module.exports = deployContracts;
