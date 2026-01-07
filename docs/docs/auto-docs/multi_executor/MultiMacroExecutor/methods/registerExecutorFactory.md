# Method: `registerExecutorFactory`

## Description

Registers a [factory] which can produce a [MacroExecutor] that can be
 used to run any macro defined in [libraries].

 Throws an [ArgumentError] if a library in [libraries] already has a
 factory registered.

 Returns a token which can be used to shut down any executors spawned in
 this way via [unregisterExecutorFactory].

## Return Type
`ExecutorFactoryToken`

## Parameters

- `factory`: `FutureOr&lt;MacroExecutor&gt; `
- `libraries`: `Set&lt;Uri&gt;`
