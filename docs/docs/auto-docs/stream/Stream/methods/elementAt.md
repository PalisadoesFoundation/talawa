# Method: `elementAt`

## Description

Returns the value of the [index]th data event of this stream.

 Stops listening to this stream after the [index]th data event has been
 received.

 Internally the method cancels its subscription after these elements. This
 means that single-subscription (non-broadcast) streams are closed and
 cannot be reused after a call to this method.

 If an error event occurs before the value is found, the future completes
 with this error.

 If a done event occurs before the value is found, the future completes
 with a [RangeError].

## Return Type
`Future&lt;T&gt;`

## Parameters

- `index`: `int`
