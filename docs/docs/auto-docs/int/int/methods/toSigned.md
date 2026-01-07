# Method: `toSigned`

## Description

Returns the least significant [width] bits of this integer, extending the
 highest retained bit to the sign. This is the same as truncating the value
 to fit in [width] bits using an signed 2-s complement representation. The
 returned value has the same bit value in all positions higher than [width].

 ```dart
                          //     V--sign bit-V
 16.toSigned(5) == -16;   //  00010000 -> 11110000
 239.toSigned(5) == 15;   //  11101111 -> 00001111
                          //     ^           ^
 ```
 This operation can be used to simulate arithmetic from low level languages.
 For example, to increment an 8 bit signed quantity:
 ```dart
 q = (q + 1).toSigned(8);
 ```
 `q` will count from `0` up to `127`, wrap to `-128` and count back up to
 `127`.

 If the input value fits in [width] bits without truncation, the result is
 the same as the input.  The minimum width needed to avoid truncation of `x`
 is `x.bitLength + 1`, i.e.
 ```dart
 x == x.toSigned(x.bitLength + 1);
 ```

## Return Type
`int`

## Parameters

- `width`: `int`
