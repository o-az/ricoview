// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC20Extended} from './ERC20Extended.sol';

contract ERC20ExtendedMock is ERC20Extended {
  function __mint (address account, uint amount) external {
    _mint(account, amount);
  }

  function __burn (address account, uint amount) external {
    _burn(account, amount);
  }
}
