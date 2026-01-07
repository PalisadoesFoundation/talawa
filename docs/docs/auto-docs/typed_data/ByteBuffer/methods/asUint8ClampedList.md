# Method: `asUint8ClampedList`

## Description

Creates a [Uint8ClampedList] _view_ of a region of this byte buffer.

 The view is backed by the bytes of this byte buffer.
 Any changes made to the `Uint8ClampedList` will also change the buffer,
 and vice versa.

 The viewed region start at [offsetInBytes] and contains [length] bytes.
 If [length] is omitted, the range extends to the end of the buffer.

 The start index and length must describe a valid range of the buffer:

 * `offsetInBytes` must not be negative,
 * `length` must not be negative, and
 * `offsetInBytes + length` must not be greater than [lengthInBytes].

## Return Type
`Uint8ClampedList`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
