# Method: `forEach`

## Description

Executes [action] on each element of this stream.

 Completes the returned [Future] when all elements of this stream
 have been processed.

 If this stream emits an error, or if the call to [action] throws,
 the returned future completes with that error,
 and processing stops.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
