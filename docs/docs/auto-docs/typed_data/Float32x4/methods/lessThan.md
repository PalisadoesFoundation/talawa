# Method: `lessThan`

## Description

Lane-wise less-than comparison.

 Compares the 32-bit floating point value of each lane of this
 to the value of the corresponding lane of [other],
 using 32-bit floating point comparison.
 _For floating point comparisons, a comparison with a NaN value is
 always false, and -0.0 (negative zero) is considered equal to 0.0
 (positive zero), and not less strictly than it._
 The result for a lane is a 32-bit signed integer which is -1
 (all bits set) if the value from this object is *less than*
 the value from [other], and the result is 0 (all bits cleared) if not,
 including if either value is a NaN value.

 Returns four values that are always either 0 or -1.

## Return Type
`Int32x4`

## Parameters

- `other`: `Float32x4`
