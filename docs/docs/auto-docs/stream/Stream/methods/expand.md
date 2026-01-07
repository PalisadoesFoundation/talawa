# Method: `expand`

## Description

Transforms each element of this stream into a sequence of elements.

 Returns a new stream where each element of this stream is replaced
 by zero or more data events.
 The event values are provided as an [Iterable] by a call to [convert]
 with the element as argument, and the elements of that iterable is
 emitted in iteration order.
 If calling [convert] throws, or if the iteration of the returned values
 throws, the error is emitted on the returned stream and iteration ends
 for that element of this stream.

 Error events and the done event of this stream are forwarded directly
 to the returned stream.

 The returned stream is a broadcast stream if this stream is.
 If a broadcast stream is listened to more than once, each subscription
 will individually call `convert` and expand the events.

## Return Type
`Stream&lt;S&gt;`

## Parameters

- ``: `dynamic`
