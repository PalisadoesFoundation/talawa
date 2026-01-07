# Method: `create`

## Description

Creates a struct view of bytes in [typedData].

 The created instance of the struct subclass will then be backed by the
 bytes at [TypedData.offsetInBytes] plus [offset] times
 [TypedData.elementSizeInBytes]. That is, the getters and setters of the
 external instance variables declared by the subclass, will read an write
 their values from the bytes of the [TypedData.buffer] of [typedData],
 starting at [TypedData.offsetInBytes] plus [offset] times
 [TypedData.elementSizeInBytes]. The [TypedData.lengthInBytes] of
 [typedData] *must* be sufficient to contain the [sizeOf] of the struct
 subclass. _It doesn't matter whether the [typedData] is, for example, a
 [Uint8List], a [Float64List], or any other [TypedData], it's only treated
 as a view into a [ByteBuffer], through its [TypedData.buffer],
 [TypedData.offsetInBytes] and [TypedData.lengthInBytes]._

 If [typedData] is omitted, a fresh [ByteBuffer], with precisely enough
 bytes for the [sizeOf] of the created struct, is allocated on the Dart
 heap, and used as memory to store the struct fields.

 If [offset] is provided, the indexing into [typedData] is offset by
 [offset] times [TypedData.elementSizeInBytes].

 Example:

 ```dart import:typed_data
 final class Point extends Struct 
 ```

 To create a struct object from a [Pointer], use [StructPointer.ref].

## Return Type
`T`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
