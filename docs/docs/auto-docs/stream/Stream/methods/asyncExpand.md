# Method: `asyncExpand`

## Description

Transforms each element into a sequence of asynchronous events.

 Returns a new stream and for each event of this stream, do the following:

 * If the event is an error event or a done event, it is emitted directly
 by the returned stream.
 * Otherwise it is an element. Then the [convert] function is called
 with the element as argument to produce a convert-stream for the element.
 * If that call throws, the error is emitted on the returned stream.
 * If the call returns `null`, no further action is taken for the elements.
 * Otherwise, this stream is paused and convert-stream is listened to.
 Every data and error event of the convert-stream is emitted on the returned
 stream in the order it is produced.
 When the convert-stream ends, this stream is resumed.

 The returned stream is a broadcast stream if this stream is.

## Return Type
`Stream&lt;E&gt;`

## Parameters

- ``: `dynamic`
