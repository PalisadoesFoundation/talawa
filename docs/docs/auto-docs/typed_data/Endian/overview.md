# Overview for `Endian`

## Description

Endianness of number representation.

 The order of bytes in memory of a number representation, with
 [little] endian having the least significant byte first, and [big] endian
 (aka. network byte order) having the most significant byte first.

 The [host] endian is the native endianness of the underlying platform,
 and the default endianness used by typed-data lists, like [Uint16List],
 on this platform. Always one of [little] or [big] endian.

 Can be specified when accessing or updating a sequence of bytes using a
 [ByteData] view. The host endianness can be used if accessing larger
 numbers by their bytes, for example through a [Uint8List] view on
 a buffer written using an [Int64List] view of the same buffer..

 It is a compile-time error for a class to attempt to extend or implement
 `Endian`.

## Members

- **_littleEndian**: `bool`
- **big**: `Endian`
- **little**: `Endian`
- **host**: `Endian`
## Constructors

### _


#### Parameters

- `_littleEndian`: `dynamic`
