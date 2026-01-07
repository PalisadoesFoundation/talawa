# Method: `listen`

## Description

Adds a subscription to this stream.

 Returns a [StreamSubscription] which handles events from this stream using
 the provided [onData], [onError] and [onDone] handlers.
 The handlers can be changed on the subscription, but they start out
 as the provided functions.

 On each data event from this stream, the subscriber's [onData] handler
 is called. If [onData] is `null`, nothing happens.

 On errors from this stream, the [onError] handler is called with the
 error object and possibly a stack trace.

 The [onError] callback must be of type `void Function(Object error)` or
 `void Function(Object error, StackTrace)`.
 The function type determines whether [onError] is invoked with a stack
 trace argument.
 The stack trace argument may be [StackTrace.empty] if this stream received
 an error without a stack trace.

 Otherwise it is called with just the error object.
 If [onError] is omitted, any errors on this stream are considered unhandled,
 and will be passed to the current [Zone]'s error handler.
 By default unhandled async errors are treated
 as if they were uncaught top-level errors.

 If this stream closes and sends a done event, the [onDone] handler is
 called. If [onDone] is `null`, nothing happens.

 If [cancelOnError] is `true`, the subscription is automatically canceled
 when the first error event is delivered. The default is `false`.

 While a subscription is paused, or when it has been canceled,
 the subscription doesn't receive events and none of the
 event handler functions are called.

## Return Type
`StreamSubscription&lt;T&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
