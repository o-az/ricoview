// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { IERC721 } from './IERC721.sol';
import { ERC721 } from './ERC721.sol';
import { IERC165 } from '../../introspection/IERC165.sol';
import { ERC165Storage } from '../../introspection/ERC165Storage.sol';
import { ERC721MetadataStorage } from './ERC721MetadataStorage.sol';

contract ERC721Mock is ERC721 {
  using ERC165Storage for ERC165Storage.Layout;

  constructor (
    string memory name,
    string memory symbol,
    string memory baseURI
  ) {
    ERC721MetadataStorage.Layout storage l = ERC721MetadataStorage.layout();
    l.name = name;
    l.symbol = symbol;
    l.baseURI = baseURI;

    ERC165Storage.layout().setSupportedInterface(type(IERC165).interfaceId, true);
    ERC165Storage.layout().setSupportedInterface(type(IERC721).interfaceId, true);
  }

  function mint (
    address account,
    uint tokenId
  ) external {
    _mint(account, tokenId);
  }

  function burn (
    uint tokenId
  ) external {
    _burn(tokenId);
  }
}
