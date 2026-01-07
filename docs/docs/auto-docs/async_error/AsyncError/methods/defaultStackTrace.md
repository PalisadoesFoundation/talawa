# Method: `defaultStackTrace`

## Description

A default stack trace for an error.

 If [error] is an [Error] and it has an [Error.stackTrace],
 that stack trace is returned.
 If not, the [StackTrace.empty] default stack trace is returned.

## Return Type
`StackTrace`

## Parameters

- `error`: `Object`
