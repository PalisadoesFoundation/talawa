# Overview for `Struct`

## Description

The supertype of all FFI struct types.

 FFI struct types should extend this class and declare fields corresponding
 to the underlying native structure.

 Field declarations in a [Struct] subclass declaration are automatically
 given a setter and getter implementation which accesses the native struct's
 field in memory.

 All field declarations in a [Struct] subclass declaration must either have
 type [int] or [double] and be annotated with a [NativeType] representing the
 native type, or must be of type [Pointer], [Array] or a subtype of [Struct]
 or [Union]. For example:

 ```c
 typedef struct  my_struct;
 ```

 ```dart
 final class MyStruct extends Struct 
 ```

 The field declarations of a [Struct] subclass *must* be marked `external`. A
 struct subclass points directly into a location of native memory ([Pointer])
 or Dart memory ([TypedData]), and the external field's getter and setter
 implementations directly read and write bytes at appropriate offsets from
 that location. This does not allow for non-native fields to also exist.

 An instance of a struct subclass cannot be created with a generative
 constructor. Instead, an instance can be created by [StructPointer.ref],
 [Struct.create], FFI call return values, FFI callback arguments,
 [StructArray], and accessing [Struct] fields. To create an instance backed
 by native memory, use [StructPointer.ref]. To create an instance backed by
 Dart memory, use [Struct.create].

## Dependencies

- _Compound, SizedNativeType

## Constructors

### Unnamed Constructor
Construct a reference to the [nullptr].

 Use [StructPointer]'s `.ref` to gain references to native memory backed
 structs.

### _fromTypedDataBase
Creates a view on a [TypedData] or [Pointer].

 Used in [StructPointer.ref], FFI calls, and FFI callbacks.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### _fromTypedData
Creates a view on [typedData].

 The length in bytes of [typedData] must at least be [sizeInBytes].

 Used in the `external` public constructor of [Struct].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
