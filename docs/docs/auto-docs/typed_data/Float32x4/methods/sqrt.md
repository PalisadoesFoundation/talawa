# Method: `sqrt`

## Description

Lane-wise square root.

 For each lane compute the 32-bit floating point square root of the
 lane's value.

 The result for a lane is a NaN value if the original value
 is less than zero or if it is a NaN value.
 The result for a negative zero, -0.0, is the same value again.
 The result for positive infinity is positive infinity.
 Otherwise the result is a positive value which approximates
 the mathematical square root of the original value.

 Returns the result for each lane.

## Return Type
`Float32x4`

