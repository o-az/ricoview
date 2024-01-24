// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './Multicall.sol';

contract MulticallMock is Multicall {
  function callTest () external pure returns (uint) {
    return 1;
  }

  function callRevertTest () external pure {
    revert('revert');
  }
}
