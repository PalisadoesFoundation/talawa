# Method: `isHighSurrogate`

## Description

Returns true iff the given value is a valid UTF-16 high (first) surrogate.
 The value must be a UTF-16 code unit, meaning it must be in the range
 0x0000-0xFFFF.

 See also:
   * https://en.wikipedia.org/wiki/UTF-16#Code_points_from_U+010000_to_U+10FFFF
   * [isLowSurrogate], which checks the same thing for low (second)
 surrogates.

## Return Type
`bool`

## Parameters

- `value`: `int`
