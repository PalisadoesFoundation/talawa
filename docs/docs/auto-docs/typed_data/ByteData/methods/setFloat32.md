# Method: `setFloat32`

## Description

Sets the four bytes starting at the specified [byteOffset] in this
 object to the IEEE 754 single-precision binary floating-point
 (binary32) representation of the specified [value].

 **Note that this method can lose precision.** The input [value] is
 a 64-bit floating point value, which will be converted to 32-bit
 floating point value by IEEE 754 rounding rules before it is stored.
 If [value] cannot be represented exactly as a binary32, it will be
 converted to the nearest binary32 value.  If two binary32 values are
 equally close, the one whose least significant bit is zero will be used.
 Note that finite (but large) values can be converted to infinity, and
 small non-zero values can be converted to zero.

 The [byteOffset] must be non-negative, and
 `byteOffset + 4` must be less than or equal to the length of this object.

## Return Type
`void`

## Parameters

- `byteOffset`: `int`
- `value`: `double`
- ``: `dynamic`
