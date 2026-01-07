# Method: `fromFunction`

## Description

Convert Dart function to a C function pointer, automatically marshalling
 the arguments and return value

 If an exception is thrown while calling ``, the native function will
 return `exceptionalReturn`, which must be assignable to return type of `f`.

 The returned function address can only be invoked on the mutator (main)
 thread of the current isolate. It will abort the process if invoked on any
 other thread. Use [NativeCallable.listener] to create callbacks that can
 be invoked from any thread.

 The pointer returned will remain alive for the duration of the current
 isolate's lifetime. After the isolate it was created in is terminated,
 invoking it from native code will cause undefined behavior.

 [Pointer.fromFunction] only accepts static or top level functions. Use
 [NativeCallable.isolateLocal] to create callbacks from any Dart function
 or closure.

## Return Type
`Pointer&lt;NativeFunction&lt;T&gt;&gt;`

## Parameters

- `f`: `Function`
- ``: `dynamic`
