# Method: `spawn`

## Description

Spawns an isolate that shares the same code as the current isolate.

 The argument [entryPoint] specifies the initial function to call
 in the spawned isolate.
 The entry-point function is invoked in the new isolate with [message]
 as the only argument.

 The [entryPoint] function must be able to be called with a single
 argument, that is, a function which accepts at least one positional
 parameter and has at most one required positional parameter.
 The function may accept any number of optional parameters,
 as long as it *can* be called with just a single argument. If
 [entryPoint] is a closure then it may implicitly send unexpected state
 to the isolate due to limitations in the Dart implementation. This can
 cause performance issues, increased memory usage
 (see http://dartbug.com/36983) or, if the state includes objects that
 can't be spent between isolates, a runtime failure. See [run] for an
 example.

 [message] must be sendable between isolates. Objects that cannot be sent
 include open files and sockets (see [SendPort.send] for details). Usually
 the initial [message] contains a [SendPort] so that the spawner and
 spawnee can communicate with each other.

 If the [paused] parameter is set to `true`,
 the isolate will start up in a paused state,
 just before calling the [entryPoint] function with the [message],
 as if by an initial call of `isolate.pause(isolate.pauseCapability)`.
 To resume the isolate, call `isolate.resume(isolate.pauseCapability)`.

 If the [errorsAreFatal], [onExit] and/or [onError] parameters are provided,
 the isolate will act as if, respectively, [setErrorsFatal],
 [addOnExitListener] and [addErrorListener] were called with the
 corresponding parameter and was processed before the isolate starts
 running.

 If [debugName] is provided, the spawned [Isolate] will be identifiable by
 this name in debuggers and logging.

 If [errorsAreFatal] is omitted, the platform may choose a default behavior
 or inherit the current isolate's behavior.

 You can also call the [setErrorsFatal], [addOnExitListener] and
 [addErrorListener] methods on the returned isolate, but unless the
 isolate was started as [paused], it may already have terminated
 before those methods can complete.

 Returns a future which will complete with an [Isolate] instance if the
 spawning succeeded. It will complete with an error otherwise.

 One can expect the base memory overhead of an isolate to be in the order
 of 30 kb.

## Return Type
`Future&lt;Isolate&gt;`

## Parameters

- ``: `dynamic`
- `message`: `T`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
