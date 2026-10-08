# Coin Flip

## Instructions 

Claim ownership of the contract below to complete this level.

## Solution

This level presents a contract with just one function `changeOwner()` that changes the owner of the
contract to the address given as parameter if the `msg.sender` is different from the `tx.origin`.
`tx.origin` returns the address of the person who has launched the original transaction. To claim 
the ownership I created a A contract that calls a B contract (that of the challenge). The A contract
takes an address as parameter of the constructor and calls the B contract, then it calls the 
`changeOwner()` function with the same address given as parameter of constructor. This method
allows that `tx.origin` is different from `msg.sender`. So to claim the ownership I followed these 
steps:

1. Create an A contract and give an `user` address as parameter.

2. The A contract inits the B contract and calls the `changeOwner()` and give `user` address as 
parameter.

3. The `tx.origin` is different from `msg.sender` so the `user` claims the ownership.

## What to remember

Never use `tx.origin` for security check.
