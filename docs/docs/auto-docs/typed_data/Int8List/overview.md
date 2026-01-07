# Overview for `Int8List`

## Description

A fixed-length list of 8-bit signed integers.

 For long lists, this implementation can be considerably
 more space- and time-efficient than the default [List] implementation.

 Integers stored in the list are truncated to their low eight bits,
 interpreted as a signed 8-bit two's complement integer with values in the
 range -128 to +127.

 It is a compile-time error for a class to attempt to extend or implement
 `Int8List`.

## Dependencies

- _TypedIntList

## Members

- **bytesPerElement**: `int`
## Constructors

### Unnamed Constructor
Creates an [Int8List] of the specified length (in elements), all of
 whose elements are initially zero.

 The list is backed by a [ByteBuffer] containing precisely [length] bytes.

### fromList
Creates a [Int8List] with the same length as the [elements] list
 and copies over the elements.

 Values are truncated to fit in the list when they are copied,
 the same way storing values truncates them.

 The list is backed by a [ByteBuffer] containing precisely `elements.length`
 bytes.

#### Parameters

- `elements`: `List&lt;int&gt;`
### view
Creates an [Int8List] _view_ of the specified region in [buffer].

 Changes in the [Int8List] will be visible in the byte
 buffer and vice versa.
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
 Merely doing `Int8List.view(other.buffer, 0, count)` may not
 point to the bytes you intended. Instead you may need to do:
 ```dart
 Int8List.view(other.buffer, other.offsetInBytes, count)
 ```
 Alternatively, use [Int8List.sublistView]
 which includes this computation:
 ```dart
 Int8List.sublistView(other, 0, count);
 ```
 (The third argument is an end index rather than a length, so if
 you start from a position greater than zero, you need not
 reduce the count correspondingly).

#### Parameters

- `buffer`: `ByteBuffer`
- ``: `dynamic`
- ``: `dynamic`
### sublistView
Creates an [Int8List] view on a range of elements of [data].

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
