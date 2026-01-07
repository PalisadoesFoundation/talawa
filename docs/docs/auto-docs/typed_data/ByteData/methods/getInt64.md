# Method: `getInt64`

## Description

The (possibly negative) integer represented by the eight bytes at
 the specified [byteOffset] in this object, in two's complement binary
 form.

 The return value will be between -2&lt;sup&gt;63</sup> and 2&lt;sup&gt;63</sup> - 1,
 inclusive.

 The [byteOffset] must be non-negative, and
 `byteOffset + 8` must be less than or equal to the length of this object.

## Return Type
`int`

## Parameters

- `byteOffset`: `int`
- ``: `dynamic`
