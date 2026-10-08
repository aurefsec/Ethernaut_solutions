# Coin Flip

## Instructions 

This is a coin flipping game where you need to build up your winning streak by guessing the outcome
of a coin flip. To complete this level you'll need to use your psychic abilities to guess the
correct outcome 10 times in a row.

## Solution

The third level was interesting. Just one function can be called, the `flip()` function. This one
verifies that each call by user is done on a different block. Moreover, it retrieves a hash of the
`block.number` -1 and divide it by a factor. If the result == 1 one boolean is set to true, else 
that is set to false. The boolean is compared with another boolean sent by the user as a parameter
of the function. If both booleans have the same value, the `consecutiveWins` variable is 
incremented and the goal of this level is to have 10 consecutive wins. To find the vulnerability I
had to understand that a block is public and can be checked by everybody. If the block is public 
and the factor is public too, I can determine the result of the divide. Each block is created every 12 
seconds, I can wait for the next block to make the new calculation, determine the boolean and send 
it to the `flip()` function. So to have 10 consecutive wins I followed these steps:

1. Retrieve the factor from the code source of the contract.

2. Calculate `blockValue` with `blockhash(block.number -1)` and divide it by the factor.

3. If the result == 1, send `true` to the `flip()` function, else send `false`.

4. The `consecutiveWins` is incremented. Wait for the next block and repeat it 10 times.

## What to remember

It is crucial to ensure that any randomness source is truly random.
