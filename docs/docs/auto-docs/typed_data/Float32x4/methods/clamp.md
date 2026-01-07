# Method: `clamp`

## Description

Lane-wise clamp to a range.

 Clamps the value of each lane to a minimum value
 of the corresponding lane of [lowerLimit]
  and a maximum value of the corresponding lane of [upperLimit].
 If the original value is lower than the minimum value, the result is
 the minimum value, and if original value is greater than the maximum
 value, the result is the maximum value.
 The result is unspecified if the maximum value is lower than the minimum
 value, or if any of the three values is a NaN value, other than that
 the result will be one of those three values, or possibly a different
 NaN value if any value is a NaN value.

 Returns the result for each lane.

## Return Type
`Float32x4`

## Parameters

- `lowerLimit`: `Float32x4`
- `upperLimit`: `Float32x4`
