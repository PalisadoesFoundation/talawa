# Overview for `Handle`

## Description

Represents `Dart_Handle` from `dart_api.h` in C.

 [Handle] is not constructible in the Dart code and serves purely as marker
 in type signatures.

 If [Handle] is part of the native signature of a [Native] external function
 or [NativeFunctionPointer.asFunction], an API handle scope is created for
 the duration of the FFI call. For more information on API scopes, refer to
 the documentation on `Dart_EnterScope` in `dart_api.h`.

## Dependencies

- NativeType

