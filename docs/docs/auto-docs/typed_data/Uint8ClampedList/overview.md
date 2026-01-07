# Overview for `Uint8ClampedList`

## Description

A fixed-length list of 8-bit unsigned integers.

 For long lists, this implementation can be considerably
 more space- and time-efficient than the default [List] implementation.

 Integers stored in the list are clamped to an unsigned eight bit value.
 That is, all values below zero are stored as zero
 and all values above 255 are stored as 255.

 It is a compile-time error for a class to attempt to extend or implement
 `Uint8ClampedList`.

## Dependencies

- _TypedIntList

## Members

- **bytesPerElement**: `int`
## Constructors

### Unnamed Constructor
Creates a [Uint8ClampedList] of the specified length (in elements), all of
 whose elements are initially zero.

 The list is backed by a [ByteBuffer] containing precisely [length] bytes.

### fromList
Creates a [Uint8ClampedList] of the same size as the [elements]
 list and copies over the values clamping when needed.

 Values are clamped to fit in the list when they are copied,
 the same way storing values clamps them.

 The list is backed by a [ByteBuffer] containing precisely `elements.length`
 bytes.

#### Parameters

- `elements`: `List&lt;int&gt;`
### view
Creates a [Uint8ClampedList] _view_ of the specified region in the
 specified byte [buffer].

 Changes in the [Uint8List] will be visible in the byte buffer
 and vice versa.
 If the [offsetInBytes] index of the region is not specified,
 it defaults to zero (the first byte in the byte buffer).
 If the length is not provided,
 the view extends to the end of the byte buffer.

 The [offsetInBytes] and [length] must be non-negative, and
 [offsetInBytes] + ([length] * [bytesPerElement]) must be less than or
 equal to the length of [buffer].

 Note that when creating a view from a [TypedData] list or byte data,
 that list or byte data may itself be a view on a larger buffer
 with a [TypedData.offsetInBytes] greater than zero.
 Merely doing `Uint8ClampedList.view(other.buffer, 0, count)` may not
 point to the bytes you intended. Instead you may need to do:
 ```dart
 Uint8ClampedList.view(other.buffer, other.offsetInBytes, count)
 ```
 Alternatively, use [Uint8ClampedList.sublistView]
 which includes this computation:
 ```dart
 Uint8ClampedList.sublistView(other, 0, count);
 ```
 (The third argument is an end index rather than a length, so if
 you start from a position greater than zero, you need not
 reduce the count correspondingly).

#### Parameters

- `buffer`: `ByteBuffer`
- ``: `dynamic`
- ``: `dynamic`
### sublistView
Creates a [Uint8ClampedList] view on a range of elements of [data].

 Creates a view on the range of `data.buffer` which corresponds
 to the elements of [data] from [start] until [end].
 If [data] is a typed data list, like [Uint16List], then the view is on
 the bytes of the elements with indices from [start] until [end].
 If [data] is a [ByteData], it's treated like a list of bytes.

 If provided, [start] and [end] must satisfy

 0 &le; `start` &le; `end` &le; *elementCount*

 where *elementCount* is the number of elements in [data], which
 is the same as the [List.length] of a typed data list.

 If omitted, [start] defaults to zero and [end] to *elementCount*.

#### Parameters

- `data`: `TypedData`
- ``: `dynamic`
- ``: `dynamic`
