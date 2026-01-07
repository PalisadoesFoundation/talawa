# Method: `setUint8`

## Description

Sets the byte at the specified [byteOffset] in this object to the
 unsigned binary representation of the specified [value], which must fit
 in a single byte.

 In other words, [value] must be between 0 and 255, inclusive.

 The [byteOffset] must be non-negative, and
 less than the length of this object.

## Return Type
`void`

## Parameters

- `byteOffset`: `int`
- `value`: `int`
