# Method: `setInt32`

## Description

Sets the four bytes starting at the specified [byteOffset] in this
 object to the two's complement binary representation of the specified
 [value], which must fit in four bytes.

 In other words, [value] must lie
 between -2&lt;sup&gt;31</sup> and 2&lt;sup&gt;31</sup> - 1, inclusive.

 The [byteOffset] must be non-negative, and
 `byteOffset + 4` must be less than or equal to the length of this object.

## Return Type
`void`

## Parameters

- `byteOffset`: `int`
- `value`: `int`
- ``: `dynamic`
