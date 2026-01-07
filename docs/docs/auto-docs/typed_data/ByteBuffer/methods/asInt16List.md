# Method: `asInt16List`

## Description

Creates a [Int16List] _view_ of a region of this byte buffer.

 The view is backed by the bytes of this byte buffer.
 Any changes made to the `Int16List` will also change the buffer,
 and vice versa.

 The viewed region start at [offsetInBytes], which must be 16-bit aligned,
 and contains [length] 16-bit integers with
 the same endianness as the host ([Endian.host]).
 If [length] is omitted, the range extends as far towards the end of
 the buffer as possible -
 if [lengthInBytes] is not even, the last byte can't be part of the view.

 The start index and length must describe a valid 16-bit aligned range
 of the buffer:

 * `offsetInBytes` must not be negative,
 * `offsetInBytes` must be divisible by two,
 * `length` must not be negative, and
 * `offsetInBytes + length * 2` must not be greater than [lengthInBytes].

## Return Type
`Int16List`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
