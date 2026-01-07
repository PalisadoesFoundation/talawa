# Method: `asFloat64List`

## Description

Creates a [Float64List] _view_ of a region of this byte buffer.

 The view is backed by the bytes of this byte buffer.
 Any changes made to the `Float64List` will also change the buffer,
 and vice versa.

 The viewed region start at [offsetInBytes], which must be 64-bit aligned,
 and contains [length] 64-bit integers.
 If [length] is omitted, the range extends as far towards the end of
 the buffer as possible -
 if [lengthInBytes] is not divisible by eight, the last bytes can't be part
 of the view.

 The start index and length must describe a valid 64-bit aligned range
 of the buffer:

 * `offsetInBytes` must not be negative,
 * `offsetInBytes` must be divisible by eight,
 * `length` must not be negative, and
 * `offsetInBytes + length * 8` must not be greater than [lengthInBytes].

## Return Type
`Float64List`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
