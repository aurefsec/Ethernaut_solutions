# Fallout

## Instructions 

Claim ownership of the contract below to complete this level.

Things that might help:

- Solidity Remix IDE

## Solution

The second level is really fast to resolve. The function `Fal1out()` is not a true constructor, so
anybody can call this function and become the owner. I had to follow just one step:

1. Retrieve 1 ether and send ether using `Fallout()` function -> makes me become the owner.
