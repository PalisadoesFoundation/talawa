# Method: `isLowSurrogate`

## Description

Returns true iff the given value is a valid UTF-16 low (second) surrogate.
 The value must be a UTF-16 code unit, meaning it must be in the range
 0x0000-0xFFFF.

 See also:
   * https://en.wikipedia.org/wiki/UTF-16#Code_points_from_U+010000_to_U+10FFFF
   * [isHighSurrogate], which checks the same thing for high (first)
 surrogates.

## Return Type
`bool`

## Parameters

- `value`: `int`
