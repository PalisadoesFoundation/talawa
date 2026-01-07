# Method: `last`

## Description

The last element of this stream.

 If this stream emits an error event,
 the returned future is completed with that error
 and processing stops.

 If this stream is empty (the done event is the first event),
 the returned future completes with an error.

## Return Type
`Future&lt;T&gt;`

