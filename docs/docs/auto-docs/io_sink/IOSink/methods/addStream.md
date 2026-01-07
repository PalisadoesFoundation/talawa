# Method: `addStream`

## Description

Adds all elements of the given [stream].

 Returns a [Future] that completes when
 all elements of the given [stream] have been added.

 If the stream contains an error, the `addStream` ends at the error,
 and the returned future completes with that error.

 This method must not be called when a stream is currently being added
 using this method.

 Individual values in the lists emitted by [stream] which are not in the
 range 0 .. 255 will be truncated to their low eight bits, as if by
 [int.toUnsigned], before being used.

## Return Type
`Future`

## Parameters

- `stream`: `Stream&lt;List&lt;int&gt;&gt;`
