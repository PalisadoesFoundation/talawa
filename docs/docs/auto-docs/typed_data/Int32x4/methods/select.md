# Method: `select`

## Description

Merge [trueValue] and [falseValue] based on this [Int32x4] bit mask:
 Select bit from [trueValue] when bit in this [Int32x4] is on.
 Select bit from [falseValue] when bit in this [Int32x4] is off.

## Return Type
`Float32x4`

## Parameters

- `trueValue`: `Float32x4`
- `falseValue`: `Float32x4`
