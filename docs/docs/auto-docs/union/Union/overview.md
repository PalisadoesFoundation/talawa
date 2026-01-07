# Overview for `Union`

## Description

The supertype of all FFI union types.

 FFI union types should extend this class and declare fields corresponding to
 the underlying native union.

 Field declarations in a [Union] subclass declaration are automatically given
 a setter and getter implementation which accesses the native union's field
 in memory.

 All field declarations in a [Union] subclass declaration must either have
 type [int] or [double] and be annotated with a [NativeType] representing the
 native type, or must be of type [Pointer], [Array] or a subtype of [Struct]
 or [Union]. For example:

 ```c
 typedef union  my_union;
 ```

 ```dart
 final class MyUnion extends Union 
 ```

 The field declarations of a [Union] subclass *must* be marked `external`. A
 union subclass points directly into a location of native memory ([Pointer])
 or Dart memory ([TypedData]), and the external field's getter and setter
 implementations directly read and write bytes at appropriate offsets from
 that location. This does not allow for non-native fields to also exist.

 An instance of a union subclass cannot be created with a generative
 constructor. Instead, an instance can be created by [UnionPointer.ref],
 [Union.create], FFI call return values, FFI callback arguments,
 [UnionArray], and accessing [Union] fields. To create an instance backed
 by native memory, use [UnionPointer.ref]. To create an instance backed by
 Dart memory, use [Union.create].

## Dependencies

- _Compound, SizedNativeType

## Constructors

### Unnamed Constructor
Construct a reference to the [nullptr].

 Use [UnionPointer]'s `.ref` to gain references to native memory backed
 unions.

### _fromTypedDataBase
Creates a view on a [TypedData] or [Pointer].

 Used in [UnionPointer.ref], FFI calls, and FFI callbacks.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### _fromTypedData
Creates a view on [typedData].

 The length in bytes of [typedData] must at least be [sizeInBytes].

 Used in the `external` public constructor of [Union].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
