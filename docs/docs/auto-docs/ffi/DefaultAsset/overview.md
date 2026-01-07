# Overview for `DefaultAsset`

## Description

Annotation specifying the default asset ID for the current library.

 The annotation applies only to `library` declarations.

 The compiler and/or runtime provides a binding from _asset ID_ to native
 library, which depends on the target platform and architecture.
 The compiler/runtime can resolve identifiers (symbols)
 against the native library, looking up native function implementations
 which are then used as the implementation of `external` Dart function
 declarations.

 If used as annotation on a `library` declaration, all [Native]-annotated
 external functions in this library will use the specified asset [id]
 for native function resolution (unless overridden by [Native.assetId]).

 If no [DefaultAsset] annotation is provided, the current library's URI
 is the default asset ID for [Native]-annotated external functions.

 Example (file `package:a/a.dart`):

 ```dart template:top
 @Native<Int64 Function(Int64, Int64)>
 external int sum(int a, int b);
 ```

 Example 2 (file `package:a/a.dart`):

 ```dart template:none
 @DefaultAsset('package:a/a.dart')
 library a;

 import 'dart:ffi';

 @Native<Int64 Function(Int64, Int64)>
 external int sum(int a, int b);
 ```

 The above two examples are equivalent.

 Prefer using the library URI as asset name when possible.

 NOTE: This is an experimental feature and may change in the future.

## Members

- **id**: `String`
  The default asset name for [Native] external functions in this library.

## Constructors

### Unnamed Constructor


