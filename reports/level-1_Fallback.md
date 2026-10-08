# Fallback

## Instructions 

Look carefully at the contract's code below.

You will beat this level if:

1. You claim ownership of the contract

2. You reduce its balance to 0

## Solution

To resolve this first level, I had to read the code and understand what part of the code could
give me ownership of the contract. I have found 2 functions that match with this goal. The first
one is the `contribute()` function and the second is `receive()`. Each of these functions can 
replace the owner by the `msg.sender`. After understanding that i had to check what condition is the
best to use for claiming ownership. The best is the function `receive()`, because the other one is
impossible to use. The condition to claim ownership is to use `receive()` by sending an amount > 0
ether and being in the mapping `contributions`. The first part of the function `contribute` does 
exactly what I want, the `msg.sender` can become a contributor by sending an amount < 0.001 ether.
So to retrieve the ownership I followed these steps:

1. Retrieve 1 ether and send 0.0001 ether using `contribute()` function -> makes me become a
contributor.

2. Use `Call()` to call the `receive()` function and send 0.0001 ether -> makes me become an owner.

The last goal was to retrieve all the ether of the contract. It will be done easily by using the
`withdraw()` function which can be call only by owner and allows him to retrieve all the
ether.

## What to remember

All the functions that allow to become owner must be secure and perfectly thought out.
