# Method: `setUint16`

## Description

Sets the two bytes starting at the specified [byteOffset] in this object
 to the unsigned binary representation of the specified [value],
 which must fit in two bytes.

 In other words, [value] must be between
 0 and 2&lt;sup&gt;16</sup> - 1, inclusive.

 The [byteOffset] must be non-negative, and
 `byteOffset + 2` must be less than or equal to the length of this object.

## Return Type
`void`

## Parameters

- `byteOffset`: `int`
- `value`: `int`
- ``: `dynamic`
