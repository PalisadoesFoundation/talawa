# Method: `throwWithStackTrace`

## Description

Throws [error] with associated stack trace [stackTrace].

 Behaves like `throw error` would
 if the [current stack trace][StackTrace.current] was [stackTrace]
 at the time of the `throw`.

 Like for a `throw`, if [error] extends [Error], and it has not been
 thrown before, its [Error.stackTrace] property will be set to
 the [stackTrace].

 This function does not guarantee to preserve the identity of [stackTrace].
 The [StackTrace] object that is caught by a `try`/`catch` of
 this error, or which is set as the [Error.stackTrace] of an [error],
 may not be the same [stackTrace] object provided as argument,
 but it will have the same contents according to [StackTrace.toString].

## Return Type
`Never`

## Parameters

- `error`: `Object`
- `stackTrace`: `StackTrace`
