# Method: `getUint64`

## Description

The positive integer represented by the eight bytes starting
 at the specified [byteOffset] in this object, in unsigned binary
 form.

 The return value will be between 0 and  2&lt;sup&gt;64</sup> - 1, inclusive.

 The [byteOffset] must be non-negative, and
 `byteOffset + 8` must be less than or equal to the length of this object.

## Return Type
`int`

## Parameters

- `byteOffset`: `int`
- ``: `dynamic`
