# Overview for `Int32List`

## Description

A fixed-length list of 32-bit signed integers that is viewable as a
 [TypedData].

 For long lists, this implementation can be considerably
 more space- and time-efficient than the default [List] implementation.

 Integers stored in the list are truncated to their low 32 bits,
 interpreted as a signed 32-bit two's complement integer with values in the
 range -2147483648 to 2147483647.

 It is a compile-time error for a class to attempt to extend or implement
 `Int32List`.

## Dependencies

- _TypedIntList

## Members

- **bytesPerElement**: `int`
## Constructors

### Unnamed Constructor
Creates an [Int32List] of the specified length (in elements), all of
 whose elements are initially zero.

 The list is backed by a [ByteBuffer] containing precisely
 [length] times 4 bytes.

### fromList
Creates a [Int32List] with the same length as the [elements] list
 and copies over the elements.

 Values are truncated to fit in the list when they are copied,
 the same way storing values truncates them.

 The list is backed by a [ByteBuffer] containing precisely
 `elements.length` times 4 bytes.

#### Parameters

- `elements`: `List&lt;int&gt;`
### view
Creates an [Int32List] _view_ of the specified region in [buffer].

 Changes in the [Int32List] will be visible in the byte
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
 Merely doing `Int32List.view(other.buffer, 0, count)` may not
 point to the bytes you intended. Instead you may need to do:
 ```dart
 Int32List.view(other.buffer, other.offsetInBytes, count)
 ```
 Alternatively, use [Int32List.sublistView]
 which includes this computation:
 ```dart
 Int32List.sublistView(other, 0, count);
 ```
 (The third argument is an end index rather than a length, so if
 you start from a position greater than zero, you need not
 reduce the count correspondingly).

#### Parameters

- `buffer`: `ByteBuffer`
- ``: `dynamic`
- ``: `dynamic`
### sublistView
Creates an [Int32List] view on a range of elements of [data].

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
 multiples of four.

#### Parameters

- `data`: `TypedData`
- ``: `dynamic`
- ``: `dynamic`
