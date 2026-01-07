# Method: `addressOf`

## Description

The native address of the implementation of [native].

 When calling this function, the argument for [native] must be an
 expression denoting a variable or function declaration which is annotated
 with [Native].
 For a variable declaration, the type [T] must be the same native type
 as the type argument to that `@Native` annotation.
 For a function declaration, the type [T] must be `NativeFunction&lt;F&gt;`
 where `F` was the type argument to that `@Native` annotation.

 For example, for a native C library exposing a function:

 ```C
 #include <stdint.h>
 int64_t sum(int64_t a, int64_t b) 
 ```

 The following code binds `sum` to a Dart function declaration, and
 extracts the address of the native `sum` implementation:

 ```dart
 import 'dart:ffi';

 typedef NativeAdd = Int64 Function(Int64, Int64);

 @Native&lt;NativeAdd&gt;
 external int sum(int a, int b);

 void  
 ```

 Similarly, for a native C library exposing a global variable:

 ```C
 const char* myString;
 ```

 The following code binds `myString` to a top-level variable in Dart, and
 extracts the address of the underlying native field:

 ```dart
 import 'dart:ffi';

 @
 external Pointer&lt;Char&gt; myString;

 void  
 ```

## Return Type
`Pointer&lt;T&gt;`

## Parameters

- `native`: `Object`
