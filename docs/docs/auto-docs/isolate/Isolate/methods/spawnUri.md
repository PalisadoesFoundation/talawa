# Method: `spawnUri`

## Description

Spawns an isolate running the script file specified by [uri].

 Creates and spawns a new isolate that runs the Dart program which has
 the [uri] file as the entry point that provides the `main` method.
 The new isolate belongs to a new [isolate group][], different from
 the isolate group of the spawning isolate.

 [isolate group]: https://dart.dev/language/concurrency#performance-and-isolate-groups

 The isolate starts executing the top-level `main` function of the library
 with the given URI.

 The target `main` must be callable with zero, one or two arguments.
 Examples:

 * ``
 * `main(args)`
 * `main(args, message)`

 When present, the parameter `args` is set to the provided [args] list.
 When present, the parameter `message` is set to the initial [message]. A
 runtime error occurs if the [message] argument's runtime type cannot be
 assigned to the second parameter of the `main` method.

 If the [paused] parameter is set to `true`,
 the isolate will start up in a paused state,
 as if by an initial call of `isolate.pause(isolate.pauseCapability)`.
 To resume the isolate, call `isolate.resume(isolate.pauseCapability)`.

 If the [errorsAreFatal], [onExit] and/or [onError] parameters are provided,
 the isolate will act as if, respectively, [setErrorsFatal],
 [addOnExitListener] and [addErrorListener] were called with the
 corresponding parameter and was processed before the isolate starts
 running.

 You can also call the [setErrorsFatal], [addOnExitListener] and
 [addErrorListener] methods on the returned isolate, but unless the
 isolate was started as [paused], it may already have terminated
 before those methods can complete.

 The [checked] parameter controls whether asserts are enabled
 in the created isolate.
 In a production-mode program, the parameter is ignored,
 and assertions are always disabled in all isolates.
 Otherwise if a `true` or `false` value is provided,
 assertions are enabled or disabled, respectively, in the
 created isolate.
 If `null` or no argument is provided, asserts are enabled
 in the created isolate if and only if they are enabled
 in the spawning isolate.

 It may not always be possible to honor the `checked` parameter.
 If the isolate code was pre-compiled, it may not be possible to change
 the checked mode setting dynamically.
 In that case, the `checked` parameter is ignored.

 If the [packageConfig] parameter is provided, then it is used to find the
 location of a package resolution configuration file for the spawned
 isolate.

 If the [automaticPackageResolution] parameter is provided, then the
 location of the package sources in the spawned isolate is automatically
 determined.

 The [environment] is a mapping from strings to strings which the
 spawned isolate uses when looking up [String.fromEnvironment] values.
 The system may add its own entries to environment as well.
 If `environment` is omitted, the spawned isolate has the same environment
 declarations as the spawning isolate.

 WARNING: The [environment] parameter is not implemented on all
 platforms yet.

 If [debugName] is provided, the spawned [Isolate] will be identifiable by
 this name in debuggers and logging.

 Returns a future that will complete with an [Isolate] instance if the
 spawning succeeded. It will complete with an error otherwise.

## Return Type
`Future&lt;Isolate&gt;`

## Parameters

- `uri`: `Uri`
- `args`: `List&lt;String&gt;`
- `message`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
