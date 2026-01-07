# Method: `reciprocal`

## Description

Lane-wise reciprocal.

 For each lane compute the result of dividing 1.0 by the lane's value.

 If the value is a NaN value, so is the result.
 If the value is infinite, the result is a zero value with the same sign.
 If the value is zero, the result is infinite with the same sign.
 Otherwise the result is an approximation of the mathematical result
 of dividing 1 by the (finite, non-zero) value of the lane.

 Returns the result for each lane.

## Return Type
`Float32x4`

