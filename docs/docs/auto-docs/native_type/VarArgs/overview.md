# Overview for `VarArgs`

## Description

The types of variadic arguments passed in C.

 The signatures in [NativeFunction] need to specify the exact types of each
 actual argument used in FFI calls.

 For example take calling `printf` in C.

 ```c
 int printf(const char *format, ...);

 void  
 ```

 To call `printf` directly from Dart with those two argument types, define
 the native type as follows:

 ```dart
  `int printf(const char *format, ...)` with `int` and `double` as
  varargs.
 typedef NativePrintfIntDouble =
     Int Function(Pointer&lt;Char&gt;, VarArgs<(Int, Double)>);
 ```

 Note the record type inside the `VarArgs` type argument.

 If only a single variadic argument is passed, the record type must
 contain a trailing comma:

 ```dart continued
  `int printf(const char *format, ...)` with only `int` as varargs.
 typedef NativePrintfInt = Int Function(Pointer&lt;Char&gt;, VarArgs<(Int,)>);
 ```

 When a variadic function is called with different variadic argument types,
 multiple bindings need to be created.
 To avoid doing multiple [DynamicLibrary.lookup]s for the same symbol, the
 pointer to the symbol can be cast:

 ```dart continued
 final dylib = DynamicLibrary.;
 final printfPointer = dylib.lookup('printf');
 final void Function(Pointer&lt;Char&gt;, int, double) printfIntDouble =
     printfPointer.cast&lt;NativeFunction&lt;NativePrintfIntDouble&gt;&gt;.;
 final void Function(Pointer&lt;Char&gt;, int) printfInt =
     printfPointer.cast&lt;NativeFunction&lt;NativePrintfInt&gt;&gt;.;
 ```

 If no variadic argument is passed, the `VarArgs` must be passed with an
 empty record type:

 ```dart
  `int printf(const char *format, ...)` with no varargs.
 typedef NativePrintfNoVarArgs = Int Function(Pointer&lt;Char&gt;, VarArgs<>);
 ```

 [VarArgs] must be the last parameter.

 [VarArgs] is not constructible in the Dart code and serves purely as marker
 in type signatures.

## Dependencies

- NativeType

