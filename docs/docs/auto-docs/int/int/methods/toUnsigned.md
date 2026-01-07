# Method: `toUnsigned`

## Description

Returns the least significant [width] bits of this integer as a
 non-negative number (i.e. unsigned representation).  The returned value has
 zeros in all bit positions higher than [width].
 ```dart
 (-1).toUnsigned(5) == 31   // 11111111  ->  00011111
 ```
 This operation can be used to simulate arithmetic from low level languages.
 For example, to increment an 8 bit quantity:
 ```dart
 q = (q + 1).toUnsigned(8);
 ```
 `q` will count from `0` up to `255` and then wrap around to `0`.

 If the input fits in [width] bits without truncation, the result is the
 same as the input.  The minimum width needed to avoid truncation of `x` is
 given by `x.bitLength`, i.e.
 ```dart
 x == x.toUnsigned(x.bitLength);
 ```

## Return Type
`int`

## Parameters

- `width`: `int`
