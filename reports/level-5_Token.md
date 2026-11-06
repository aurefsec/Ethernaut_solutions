# Token

## Instructions

The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your
hands on any additional tokens. Preferably a very large amount of tokens.

## Solution

The original contract has been modified to work with version 0.8. That's why the `unchecked`
block was added in the `transfer()` function.

This challenge was more difficult than it should have been because I tried to understand what
the vulnerability was in version 0.8, but the vulnerability only exists in older versions. With
version 0.6, the underflow was silent and a uint is always positive, so if I subtract a greater
value from the first value in the `transfer()` function, my new value will be near the overflow
and I can retrieve a really big amount of tokens. Two users are necessary because with only one
user, both operations in the `transfer()` function cancel each other out. So, to retrieve a very
large amount of tokens, I followed these steps:

1. Create the contract and 2 user addresses.

2. The owner sends 20 tokens to `user1`.

3. `user1` sends 1000 tokens to `user2`.

4. `user1` ends up with (20 - 1000 = 2^256 - 980) tokens.

## What to remember

With version 0.6, underflow/overflow are silent.
