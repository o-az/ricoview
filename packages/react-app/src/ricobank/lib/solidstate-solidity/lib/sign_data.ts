import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import { ethers } from 'hardhat';

export interface SignDataArgs {
  values: any[];
  types: string[];
  nonce: any;
  address: any;
}

export async function signData(
  signer: SignerWithAddress,
  { values, types, nonce, address }: SignDataArgs,
) {
  const hash = ethers.utils.solidityKeccak256(
    [...types, 'uint256', 'address'],
    [...values, nonce, address],
  );

  const signature = await signer.signMessage(ethers.utils.arrayify(hash));
  return ethers.utils.arrayify(signature);
}
