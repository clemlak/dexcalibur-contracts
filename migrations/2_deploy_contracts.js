/* eslint-env node */
/* global artifacts */

const Dexcalibur = artifacts.require('Dexcalibur');

function deployContracts(deployer) {
  deployer.deploy(Dexcalibur);
}

module.exports = deployContracts;
