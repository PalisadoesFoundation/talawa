# Method: `length`

## Description

The number of elements in this stream.

 Waits for all elements of this stream. When this stream ends,
 the returned future is completed with the number of elements.

 If this stream emits an error,
 the returned future is completed with that error,
 and processing stops.

 This operation listens to this stream, and a non-broadcast stream cannot
 be reused after finding its length.

## Return Type
`Future&lt;int&gt;`

