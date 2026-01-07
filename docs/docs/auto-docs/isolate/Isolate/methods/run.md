# Method: `run`

## Description

Runs [computation] in a new isolate and returns the result.

 ```dart
 int slowFib(int n) =>
     n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

 // Compute without blocking current isolate.
 var fib40 = await Isolate.run( => slowFib(40));
 ```

 If [computation] is asynchronous (returns a `Future&lt;R&gt;`) then
 that future is awaited in the new isolate, completing the entire
 asynchronous computation, before returning the result.

 ```dart
 int slowFib(int n) =>
     n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);
 Stream&lt;int&gt;  async* 

 // Returns `Future&lt;int&gt;`.
 var fib40 = await Isolate.run( => .elementAt(40));
 ```

 If [computation] throws, the isolate is terminated and this
 function throws the same error.

 ```dart import:convert
 Future&lt;int&gt;  async 

 try  on StateError catch (e, s) 
 ```
 Any uncaught asynchronous errors will terminate the computation as well,
 but will be reported as a [RemoteError] because [addErrorListener]
 does not provide the original error object.

 The result is sent using [exit], which means it's sent to this
 isolate without copying.

 The [computation] function and its result (or error) must be
 sendable between isolates. Objects that cannot be sent include open
 files and sockets (see [SendPort.send] for details).

 If [computation] is a closure then it may implicitly send unexpected
 state to the isolate due to limitations in the Dart implementation. This
 can cause performance issues, increased memory usage
 (see http://dartbug.com/36983) or, if the state includes objects that
 can't be spent between isolates, a runtime failure.

 ```dart import:convert import:io

 void serializeAndWrite(File f, Object o) async 
 ```

 In such cases, you can create a new function to call [Isolate.run] that
 takes all of the required state as arguments.

 ```dart import:convert import:io

 void serializeAndWrite(File f, Object o) async 
 ```

 The [debugName] is only used to name the new isolate for debugging.

## Return Type
`Future&lt;R&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
