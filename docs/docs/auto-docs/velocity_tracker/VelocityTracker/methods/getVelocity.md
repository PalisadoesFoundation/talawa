# Method: `getVelocity`

## Description

Computes the velocity of the pointer at the time of the last
 provided data point.

 This can be expensive. Only call this when you need the velocity.

 Returns [Velocity.zero] if there is no data from which to compute an
 estimate or if the estimated velocity is zero.

## Return Type
`Velocity`

