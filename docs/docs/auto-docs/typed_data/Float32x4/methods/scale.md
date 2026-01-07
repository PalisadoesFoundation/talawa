# Method: `scale`

## Description

Lane-wise multiplication by [scale].

 Returns a result where each lane is the result of multiplying the
 corresponding lane of this value with [scale].
 This can happen either by converting the lane value to a 64-bit
 floating point value, multiplying it with [scale] and converting
 the result back to a 32-bit floating point value,
 or by converting [scale] to a 32-bit floating point value
 and performing a 32-bit floating point multiplication.

 In the latter case it is equivalent to `thisValue * Float32x4.splat(s)`.

## Return Type
`Float32x4`

## Parameters

- `scale`: `double`
