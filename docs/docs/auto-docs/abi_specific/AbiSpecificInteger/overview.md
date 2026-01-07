# Overview for `AbiSpecificInteger`

## Description

The supertype of all [Abi]-specific integer types.

 [Abi]-specific integers should extend this class and annotate it with
 [AbiSpecificIntegerMapping] to declare the integer size and signedness
 for [Abi.values].

 For example:

 ```
  The C `uintptr_t` type.
 
  The [UintPtr] type is a native type, and should not be constructed in
  Dart code.
  It occurs only in native type signatures and as annotation on [Struct]
  and [Union] fields.
 @
 final class UintPtr extends AbiSpecificInteger 
 ```

## Dependencies

- SizedNativeType

## Constructors

### Unnamed Constructor


