# Overview for `BytesBuilder`

## Description

Builds a list of bytes, allowing bytes and lists of bytes to be added at the
 end.

 Used to efficiently collect bytes and lists of bytes.

## Constructors

### Unnamed Constructor
Construct a new empty [BytesBuilder].

 If [copy] is true (the default), the created builder is a *copying*
 builder. A copying builder maintains its own internal buffer and copies
 the bytes added to it eagerly.

 If [copy] set to false, the created builder assumes that lists added
 to it will not change.
 Any [Uint8List] added using [add] is kept until
 [toBytes] or [takeBytes] is called,
 and only then are their contents copied.
 A non-[Uint8List] may be copied eagerly.
 If only a single [Uint8List] is added to the builder,
 that list is returned by [toBytes] or [takeBytes] directly, without any copying.
 A list added to a non-copying builder *should not* change its content
 after being added, and it *must not* change its length after being added.
 (Normal [Uint8List]s are fixed length lists, but growing lists implementing
 [Uint8List] exist.)

