import { ethers } from 'hardhat';
import { describeBehaviorOfERC165 } from '@solidstate/spec';
import { ERC165Mock, ERC165Mock__factory } from '../../typechain';

describe('ERC165', function () {
  let instance: ERC165Mock;

  beforeEach(async function () {
    const [deployer] = await ethers.getSigners();
    instance = await new ERC165Mock__factory(deployer).deploy();
  });

  describeBehaviorOfERC165({
    deploy: async () => instance as any,
    interfaceIds: [],
  });
});
