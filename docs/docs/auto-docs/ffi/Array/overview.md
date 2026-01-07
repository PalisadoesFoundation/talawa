# Overview for `Array`

## Description

A fixed-sized array of [T]s.

## Dependencies

- _Compound

## Constructors

### Unnamed Constructor
Annotation to specify [Array] dimensions in [Struct]s.

 ```dart
 final class MyStruct extends Struct 
 ```

 Do not invoke in normal code.

### multi
Annotation to specify [Array] dimensions in [Struct]s.

 ```dart
 final class MyStruct extends Struct 
 ```

 Do not invoke in normal code.

#### Parameters

- `dimensions`: `List&lt;int&gt;`
### variable
Annotation to specify a variable length [Array] in [Struct]s.

 Can only be used on the last field of a struct. The last field of the
 struct is _not_ taken into account in [sizeOf]. Using an
 [AllocatorAlloc.call] will _not_ allocate any backing storage for the
 variable length array. Instead use [Allocator.allocate] and calculate the
 required number of bytes manually.

 ```dart
 import 'dart:ffi';
 import 'package:ffi/ffi.dart';

 final class MyStruct extends Struct 

 void  
 ```

 The variable length is always the outermost dimension of the array.

 ```dart
 import 'dart:ffi';
 import 'package:ffi/ffi.dart';

 final class MyStruct extends Struct 
 ```

 Accessing variable length inline arrays of structs passed by value in FFI
 calls and callbacks is undefined behavior. Accessing variable length
 inline arrays in structs passed by value is undefined behavior in C.

 For more information about variable length inline arrays in C, please
 refer to: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html.

 Do not invoke in normal code.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### variableWithVariableDimension
Annotation to specify a variable length [Array] with a configurable
 variable dimension ([dimension1]) in [Struct]s.

 Can only be used on the last field of a struct. When [dimension1] is set
 to a value greater than zero (`0`), the last field of the struct is taken
 into account in [sizeOf] and [AllocatorAlloc.call]. This is particularly
 useful when working with Windows APIs, where most structs with variable
 length arrays are defined to have an initial dimension of one (`1`).

 ```dart
 import 'dart:ffi';
 import 'package:ffi/ffi.dart';

 final class MyStruct extends Struct 

 void  
 ```

 The variable length is always the outermost dimension of the array.

 Do not invoke in normal code.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### variableMulti
Annotation to a variable length [Array] in [Struct]s.

 ```dart
 final class MyStruct extends Struct 

 final class MyStruct2 extends Struct 

 final class MyStruct3 extends Struct 
 ```

 The variable length is always the outermost dimension of the array.

 [variableDimension] is the outermost dimension of the variable length
 array (defaults to zero (`0`)). When [variableDimension] is set to a value
 greater than zero (`0`), the last field of the struct is taken into
 account in [sizeOf] and [AllocatorAlloc.call].

 Do not invoke in normal code.

#### Parameters

- `dimensions`: `List&lt;int&gt;`
- ``: `dynamic`
