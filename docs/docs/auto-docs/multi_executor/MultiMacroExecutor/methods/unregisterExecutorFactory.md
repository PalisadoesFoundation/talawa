# Method: `unregisterExecutorFactory`

## Description

Unregisters [token] for all [libraries].

 If [libraries] is not passed (or `null`), then the token is unregistered
 for all libraries.

 If no libraries are registered for [token] after this call, then the
 executor mapped to [token] will be shut down and the token will be freed.

 This should be called whenever the executors might be stale, or as an
 optimization to shut them down when they are known to be not used any
 longer.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `token`: `ExecutorFactoryToken`
- ``: `dynamic`
