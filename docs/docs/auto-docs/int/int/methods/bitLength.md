# Method: `bitLength`

## Description

Returns the minimum number of bits required to store this integer.

 The number of bits excludes the sign bit, which gives the natural length
 for non-negative (unsigned) values.  Negative values are complemented to
 return the bit position of the first bit that differs from the sign bit.

 To find the number of bits needed to store the value as a signed value,
 add one, i.e. use `x.bitLength + 1`.
 ```dart
 x.bitLength == (-x-1).bitLength;

 3.bitLength == 2;     // 00000011
 2.bitLength == 2;     // 00000010
 1.bitLength == 1;     // 00000001
 0.bitLength == 0;     // 00000000
 (-1).bitLength == 0;  // 11111111
 (-2).bitLength == 1;  // 11111110
 (-3).bitLength == 2;  // 11111101
 (-4).bitLength == 2;  // 11111100
 ```

## Return Type
`int`

