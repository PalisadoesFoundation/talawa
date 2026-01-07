# Method: `first`

## Description

The first element of this stream.

 Stops listening to this stream after the first element has been received.

 Internally the method cancels its subscription after the first element.
 This means that single-subscription (non-broadcast) streams are closed
 and cannot be reused after a call to this getter.

 If an error event occurs before the first data event, the returned future
 is completed with that error.

 If this stream is empty (a done event occurs before the first data event),
 the returned future completes with an error.

 Except for the type of the error, this method is equivalent to
 `this.elementAt(0)`.

## Return Type
`Future&lt;T&gt;`

