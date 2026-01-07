# Overview for `NativeCallable`

## Description

A native callable which listens for calls to a native function.

 Creates a native function linked to a Dart function, so that calling the
 native function will call the Dart function in some way, with the arguments
 converted to Dart values.

## Members

- **keepIsolateAlive**: `bool`
  Whether this [NativeCallable] keeps its [Isolate] alive.

 By default, [NativeCallable]s keep the [Isolate] that created them alive
 until [close] is called. If [keepIsolateAlive] is set to `false`, the
 isolate may exit even if the [NativeCallable] isn't closed.

## Constructors

### isolateLocal
Constructs a [NativeCallable] that must be invoked from the same thread
 that created it.

 If an exception is thrown by the [callback], the native function will
 return the `exceptionalReturn`, which must be assignable to the return
 type of the [callback].

 The returned function address can only be invoked on the mutator (main)
 thread of the current isolate. It will abort the process if invoked on any
 other thread. Use [NativeCallable.listener] to create callbacks that can
 be invoked from any thread.

 Unlike [Pointer.fromFunction], [NativeCallable]s can be constructed from
 any Dart function or closure, not just static or top level functions.

 This callback must be [close]d when it is no longer needed. The [Isolate]
 that created the callback will be kept alive until [close] is called.
 After [NativeCallable.close] is called, invoking the [nativeFunction] from
 native code will cause undefined behavior.

#### Parameters

- `callback`: `Function`
- ``: `dynamic`
### listener
Constructs a [NativeCallable] that can be invoked from any thread.

 When the native code invokes the function [nativeFunction], the arguments
 will be sent over a [SendPort] to the [Isolate] that created the
 [NativeCallable], and the callback will be invoked.

 The native code does not wait for a response from the callback, so only
 functions returning void are supported.

 The callback will be invoked at some time in the future. The native caller
 cannot assume the callback will be run immediately. Resources passed to
 the callback (such as pointers to malloc'd memory, or output parameters)
 must be valid until the call completes.

 This callback must be [close]d when it is no longer needed. The [Isolate]
 that created the callback will be kept alive until [close] is called.
 After [NativeCallable.close] is called, invoking the [nativeFunction] from
 native code will cause undefined behavior.

 For example:

 ```dart
 import 'dart:async';
 import 'dart:ffi';
 import 'package:ffi/ffi.dart';

 // Processes a simple HTTP GET request using a native HTTP library that
 // processes the request on a background thread.
 Future&lt;String&gt; httpGet(String uri) async 

 // Load the native functions from a DynamicLibrary.
 final DynamicLibrary dylib = DynamicLibrary.;
 typedef NativeHttpCallback = Void Function(Pointer&lt;Utf8&gt;);

 typedef HttpGetFunction = void Function(
     Pointer&lt;Utf8>, Pointer&lt;NativeFunction<NativeHttpCallback&gt;&gt;);
 typedef HttpGetNativeFunction = Void Function(
     Pointer&lt;Utf8>, Pointer&lt;NativeFunction<NativeHttpCallback&gt;&gt;);
 final nativeHttpGet =
     dylib.lookupFunction&lt;HttpGetNativeFunction, HttpGetFunction&gt;(
         'http_get');
 ```

#### Parameters

- `callback`: `Function`
