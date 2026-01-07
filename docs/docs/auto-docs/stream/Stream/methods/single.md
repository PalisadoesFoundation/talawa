# Method: `single`

## Description

The single element of this stream.

 If this stream emits an error event,
 the returned future is completed with that error
 and processing stops.

 If this [Stream] is empty or has more than one element,
 the returned future completes with an error.

## Return Type
`Future&lt;T&gt;`

