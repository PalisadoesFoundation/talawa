# Method: `addErrorListener`

## Description

Requests that uncaught errors of the isolate are sent back to [port].

 The errors are sent back as two-element lists.
 The first element is a `String` representation of the error, usually
 created by calling `toString` on the error.
 The second element is a `String` representation of an accompanying
 stack trace, or `null` if no stack trace was provided.
 To convert this back to a [StackTrace] object, use [StackTrace.fromString].

 Listening using the same port more than once does nothing.
 A port will only receive each error once,
 and will only need to be removed once using [removeErrorListener].

 Closing the receive port that is associated with the port does not stop
 the isolate from sending uncaught errors, they are just going to be lost.
 Instead use [removeErrorListener] to stop receiving errors on [port].

 Since isolates run concurrently, it's possible for it to exit before the
 error listener is established. To avoid this, start the isolate paused,
 add the listener and then resume the isolate.

## Return Type
`void`

## Parameters

- `port`: `SendPort`
