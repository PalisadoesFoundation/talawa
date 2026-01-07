# Method: `asUint32List`

## Description

Creates a [Uint32List] _view_ of a region of this byte buffer.

 The view is backed by the bytes of this byte buffer.
 Any changes made to the `Uint32List` will also change the buffer,
 and vice versa.

 The viewed region start at [offsetInBytes], which must be 32-bit aligned,
 and contains [length] 32-bit integers with
 the same endianness as the host ([Endian.host]).
 If [length] is omitted, the range extends as far towards the end of
 the buffer as possible -
 if [lengthInBytes] is not divisible by four, the last bytes can't be part
 of the view.

 The start index and length must describe a valid 32-bit aligned range
 of the buffer:

 * `offsetInBytes` must not be negative,
 * `offsetInBytes` must be divisible by four,
 * `length` must not be negative, and
 * `offsetInBytes + length * 4` must not be greater than [lengthInBytes].

## Return Type
`Uint32List`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
