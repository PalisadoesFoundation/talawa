# Method: `asInt32x4List`

## Description

Creates a [Int32x4List] _view_ of a region of this byte buffer.

 The view is backed by the bytes of this byte buffer.
 Any changes made to the `Int32x4List` will also change the buffer,
 and vice versa.

 The viewed region start at [offsetInBytes], which must be 128-bit aligned,
 and contains [length] 128-bit integers.
 If [length] is omitted, the range extends as far towards the end of
 the buffer as possible -
 if [lengthInBytes] is not divisible by 16, the last bytes can't be part
 of the view.

 The start index and length must describe a valid 128-bit aligned range
 of the buffer:

 * `offsetInBytes` must not be negative,
 * `offsetInBytes` must be divisible by sixteen,
 * `length` must not be negative, and
 * `offsetInBytes + length * 16` must not be greater than [lengthInBytes].

## Return Type
`Int32x4List`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
