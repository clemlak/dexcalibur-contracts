/* eslint-env node */
/* global artifacts */

const Dexcalibur = artifacts.require('Dexcalibur');

function deployContracts(deployer, network) {
  if (network === 'development') {
    deployer.deploy(Dexcalibur);
  } else if (network === 'ropsten') {
    deployer.deploy(Dexcalibur);
  }
}

module.exports = deployContracts;
