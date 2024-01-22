// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC1155Enumerable} from './ERC1155Enumerable.sol';
import {IERC1155} from './IERC1155.sol';
import {ERC165Storage} from '../../introspection/ERC165Storage.sol';
import {IERC165, ERC165} from '../../introspection/ERC165.sol';

contract ERC1155EnumerableMock is ERC1155Enumerable, ERC165 {
  using ERC165Storage for ERC165Storage.Layout;

  constructor () {
    ERC165Storage.layout().setSupportedInterface(type(IERC165).interfaceId, true);
    ERC165Storage.layout().setSupportedInterface(type(IERC1155).interfaceId, true);
  }

  function __mint (
    address account,
    uint id,
    uint amount
  ) external {
    _mint(account, id, amount, '');
  }

  function __burn (
    address account,
    uint id,
    uint amount
  ) external {
    _burn(account, id, amount);
  }
}
