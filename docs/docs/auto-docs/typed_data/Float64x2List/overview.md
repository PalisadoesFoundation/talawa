# Overview for `Float64x2List`

## Description

A fixed-length list of [Float64x2] numbers that is viewable as a
 [TypedData].

 For long lists, this implementation will be considerably more
 space- and time-efficient than the default [List] implementation.

 It is a compile-time error for a class to attempt to extend or implement
 `Float64x2List`.

## Dependencies

- TypedDataList, TypedData

## Members

- **bytesPerElement**: `int`
## Constructors

### Unnamed Constructor
Creates a [Float64x2List] of the specified length (in elements),
 all of whose elements have all lanes set to zero.

 The list is backed by a [ByteBuffer] containing precisely
 [length] times 16 bytes.

### fromList
Creates a [Float64x2List] with the same length as the [elements] list
 and copies over the elements.

 The list is backed by a [ByteBuffer] containing precisely
 `elements.length` times 16 bytes.

#### Parameters

- `elements`: `List&lt;Float64x2&gt;`
### view
Creates a [Float64x2List] _view_ of the specified region in [buffer].

 Changes in the [Float64x2List] will be visible in the byte
 buffer and vice versa.
 If the [offsetInBytes] index of the region is not specified,
 it defaults to zero (the first byte in the byte buffer).
 If the length is not provided,
 the view extends to the end of the byte buffer.

 The [offsetInBytes] and [length] must be non-negative, and
 [offsetInBytes] + ([length] * [bytesPerElement]) must be less than or
 equal to the length of [buffer].

 The [offsetInBytes] must be a multiple of [bytesPerElement].

 Note that when creating a view from a [TypedData] list or byte data,
 that list or byte data may itself be a view on a larger buffer
 with a [TypedData.offsetInBytes] greater than zero.
 Merely doing `Float64x2List.view(other.buffer, 0, count)` may not
 point to the bytes you intended. Instead you may need to do:
 ```dart
 Float64x2List.view(other.buffer, other.offsetInBytes, count)
 ```
 Alternatively, use [Float64x2List.sublistView]
 which includes this computation:
 ```dart
 Float64x2List.sublistView(other, 0, count);
 ```
 (The third argument is an end index rather than a length, so if
 you start from a position greater than zero, you need not
 reduce the count correspondingly).

#### Parameters

- `buffer`: `ByteBuffer`
- ``: `dynamic`
- ``: `dynamic`
### sublistView
Creates an [Float64x2List] view on a range of elements of [data].

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

 The start and end indices of the range of bytes being viewed must be
 multiples of sixteen.

#### Parameters

- `data`: `TypedData`
- ``: `dynamic`
- ``: `dynamic`
