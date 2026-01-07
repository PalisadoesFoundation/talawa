# Method: `isEmpty`

## Description

Whether this stream contains any elements.

 Waits for the first element of this stream, then completes the returned
 future with `false`.
 If this stream ends without emitting any elements, the returned future is
 completed with `true`.

 If the first event is an error, the returned future is completed with that
 error.

 This operation listens to this stream, and a non-broadcast stream cannot
 be reused after checking whether it is empty.

## Return Type
`Future&lt;bool&gt;`

