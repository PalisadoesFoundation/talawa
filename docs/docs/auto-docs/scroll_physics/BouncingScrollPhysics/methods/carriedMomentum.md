# Method: `carriedMomentum`

## Description

Momentum build-up function that mimics iOS's scroll speed increase with repeated flings.

 The velocity of the last fling is not an important factor. Existing speed
 and (related) time since last fling are factors for the velocity transfer
 calculations.

## Return Type
`double`

## Parameters

- `existingVelocity`: `double`
