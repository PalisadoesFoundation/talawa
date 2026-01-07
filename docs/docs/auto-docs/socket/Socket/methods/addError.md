# Method: `addError`

## Description

Unsupported operation on sockets.

 This method, which is inherited from [IOSink], is not supported on
 sockets, and **must not** be called.
 Sockets have no way to report errors, so any error passed in to
 a socket using [addError] would be lost.

## Return Type
`void`

## Parameters

- `error`: `Object`
- ``: `dynamic`
