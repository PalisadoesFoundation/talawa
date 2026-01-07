# Method: `max`

## Description

Lane-wise maximum.

 For each lane select the greater of the lane value of this and [other].

 The result is the greater of the two lane values if either is greater.
 The result is unspecified if either lane contains a NaN value or
 if the values are -0.0 and 0.0, so that neither value is smaller
 or greater than the other.
 Different platforms may give different results in those cases,
 but always one of the lane values.

 Returns the result for each lane.

## Return Type
`Float32x4`

## Parameters

- `other`: `Float32x4`
