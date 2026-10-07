// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Telephone} from "../src/level-4_Telephone.sol";

contract Origin
{
  Telephone tl;
  address public owner;

  constructor()
    owner = msg.sender;

  vm.prank(msg.sender);
  tl = new Telephone();

}

contract TelephoneExploit is Test
{
  Origin  or;
  address user1;

  function setUp()
  {
    user1 = makeAddr("user1");
    vm.prank(user1);
    or = new Origin();
  }
}
