# Method: `setInt8`

## Description

Sets the byte at the specified [byteOffset] in this object to the
 two's complement binary representation of the specified [value], which
 must fit in a single byte.

 In other words, [value] must be between -128 and 127, inclusive.

 The [byteOffset] must be non-negative, and
 less than the length of this object.

## Return Type
`void`

## Parameters

- `byteOffset`: `int`
- `value`: `int`
