# Overview for `BinaryCodec`

## Description

[MessageCodec] with unencoded binary messages represented using [ByteData].

 On Android, messages will be represented using `java.nio.ByteBuffer`.
 On iOS, messages will be represented using `NSData`.

 When sending outgoing messages from Android, be sure to use direct `ByteBuffer`
 as opposed to indirect. The `` API provides indirect buffers by default
 and you will get empty `ByteData` objects in Dart.

## Dependencies

- MessageCodec

## Constructors

### Unnamed Constructor
Creates a [MessageCodec] with unencoded binary messages represented using
 [ByteData].

