# Overview for `Native`

## Description

Annotation binding an external declaration to its native implementation.

 Can only be applied to `external` declarations of static and top-level
 functions and variables.

 A [Native]-annotated `external` function is implemented by native code.
 The implementation is found in the native library denoted by [assetId].
 Similarly, a [Native]-annotated `external` variable is implemented by
 reading from or writing to native memory.

 The compiler and/or runtime provides a binding from [assetId] to native
 library, which depends on the target platform.
 The compiler/runtime can then resolve/lookup symbols (identifiers)
 against the native library, to find a native function or a native global
 variable, and bind an `external` Dart function or variable declaration to
 that native declaration.
 By default, the runtime expects a native symbol with the same name as the
 annotated function or variable in Dart. This can be overridden with the
 [symbol] parameter on the annotation.

 When used on a function, [T] must be a function type that represents the
 native function's parameter and return types. The parameter and return types
 must be subtypes of [NativeType].

 When used on a variable, [T] must be a compatible native type. For example,
 an [int] field can be annotated with [Int32].

 If the type argument [T] is omitted in the `@Native` annotation, it is
 inferred from the static type of the declaration, which must meet the
 following constraints:

 For function or method declarations:
 - The return type must be one of the following:
   - [Pointer]
   - `void`
   - Subtype of compound types, such as [Struct] or [Union]
 - The parameter types must be subtypes of compound types or [Pointer]

 For variable declarations, the type can be any of the following:
   - [Pointer]
   - Subtype of compound types, such as [Struct] or [Union]

 For native global variables that cannot be reassigned, a `final` variable in
 Dart or a getter can be used to prevent modifications to the native field.

 Example:

 ```dart template:top
 @Native<Int64 Function(Int64, Int64)>
 external int sum(int a, int b);

 @
 external void free(Pointer p);

 @Native&lt;Int64&gt;
 external int aGlobalInt;

 @
 external final Pointer&lt;Char&gt; aGlobalString;
 ```

 Calling a `@Native` function, as well as reading or writing to a `@Native`
 variable, will try to resolve the [symbol] in (in the order):
 1. the provided or default [assetId],
 2. the native resolver set with `Dart_SetFfiNativeResolver` in
    `dart_api.h`, and
 3. the current process.

 At least one of those three *must* provide a binding for the symbol,
 otherwise the method call or the variable access fails.

 NOTE: This is an experimental feature and may change in the future.

## Members

- **symbol**: `String?`
  The native symbol to be resolved, if not using the default.

 If not specified, the default symbol used for native function lookup
 is the annotated function's name.

 Example:

 ```dart template:top
 @Native<Int64 Function(Int64, Int64)>
 external int sum(int a, int b);
 ```

 Example 2:

 ```dart template:top
 @Native<Int64 Function(Int64, Int64)>(symbol: 'sum')
 external int sum(int a, int b);
 ```

 The above two examples are equivalent.

 Prefer omitting the [symbol] when possible.

- **assetId**: `String?`
  The ID of the asset in which [symbol] is resolved, if not using the
 default.

 If no asset name is specified, the default is to use an asset ID
 specified using an [DefaultAsset] annotation on the current library's
 `library` declaration, and if there is no [DefaultAsset] annotation on
 the current library, the library's URI (as a string) is used instead.

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

 Example 3 (file `package:a/a.dart`):

 ```dart template:top
 @Native<Int64 Function(Int64, Int64)>(assetId: 'package:a/a.dart')
 external int sum(int a, int b);
 ```

 The above three examples are all equivalent.

 Prefer using the library URI as an asset name over specifying it.
 Prefer using an [DefaultAsset] on the `library` declaration
 over specifying the asset name in a [Native] annotation.

- **isLeaf**: `bool`
  Whether the function is a leaf function.

 Leaf functions are small, short-running, non-blocking functions which are
 not allowed to call back into Dart or use any Dart VM APIs. Leaf functions
 are invoked bypassing some of the heavier parts of the standard
 Dart-to-Native calling sequence which reduces the invocation overhead,
 making leaf calls faster than non-leaf calls. However, this implies that a
 thread executing a leaf function can't cooperate with the Dart runtime. A
 long running or blocking leaf function will delay any operation which
 requires synchronization between all threads associated with an isolate
 group until after the leaf function returns. For example, if one isolate
 in a group is trying to perform a GC and a second isolate is blocked in a
 leaf call, then the first isolate will have to pause and wait until this
 leaf call returns.

 This value has no meaning for native fields.

## Constructors

### Unnamed Constructor


