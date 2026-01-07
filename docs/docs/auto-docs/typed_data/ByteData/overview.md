# Overview for `ByteData`

## Description

A fixed-length, random-access sequence of bytes that also provides random
 and unaligned access to the fixed-width integers and floating point
 numbers represented by those bytes.

 `ByteData` may be used to pack and unpack data from external sources
 (such as networks or files systems), and to process large quantities
 of numerical data more efficiently than would be possible
 with ordinary [List] implementations.
 `ByteData` can save space, by eliminating the need for object headers,
 and time, by eliminating the need for data copies.

 If data comes in as bytes, they can be converted to `ByteData` by
 sharing the same buffer.
 ```dart
 Uint8List bytes = ...;
 var blob = ByteData.sublistView(bytes);
 if (blob.getUint32(0, Endian.little) == 0x04034b50) 
 ```

 Finally, `ByteData` may be used to intentionally reinterpret the bytes
 representing one arithmetic type as another.
 For example this code fragment determine what 32-bit signed integer
 is represented by the bytes of a 32-bit floating point number
 (both stored as big endian):
 ```dart
 var bdata = ByteData(8);
 bdata.setFloat32(0, 3.04);
 int huh = bdata.getInt32(0); // 0x40428f5c
 ```

 It is a compile-time error for a class to attempt to extend or implement
 `ByteData`.

## Dependencies

- TypedData

## Constructors

### Unnamed Constructor
Creates a [ByteData] of the specified length (in elements), all of
 whose bytes are initially zero.

### view
Creates an [ByteData] _view_ of the specified region in [buffer].

 Changes in the [ByteData] will be visible in the byte
 buffer and vice versa.
 If the [offsetInBytes] index of the region is not specified,
 it defaults to zero (the first byte in the byte buffer).
 If the length is not provided,
 the view extends to the end of the byte buffer.

 The [offsetInBytes] and [length] must be non-negative, and
 [offsetInBytes] + [length] must be less than or
 equal to the length of [buffer].

 Note that when creating a view from a [TypedData] list or byte data,
 that list or byte data may itself be a view on a larger buffer
 with a [TypedData.offsetInBytes] greater than zero.
 Merely doing `ByteData.view(other.buffer, 0, count)` may not
 point to the bytes you intended. Instead you may need to do:
 ```dart
 ByteData.view(other.buffer, other.offsetInBytes, count)
 ```
 Alternatively, use [ByteData.sublistView]
 which includes this computation:
 ```dart
 ByteData.sublistView(other, 0, count);
 ```
 (The third argument is an end index rather than a length, so if
 you start from a position greater than zero, you need not
 reduce the count correspondingly).

#### Parameters

- `buffer`: `ByteBuffer`
- ``: `dynamic`
- ``: `dynamic`
### sublistView
Creates a [ByteData] view on a range of elements of [data].

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
