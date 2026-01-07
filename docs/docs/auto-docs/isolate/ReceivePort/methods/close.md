# Method: `close`

## Description

Closes the receive port.

 No further events will be received by the receive port,
 or emitted as stream events.

 If [listen] has been called and the [StreamSubscription] has not
 been canceled yet, the subscription will be closed with a "done"
 event.

 If the stream has already been canceled this method has no effect.

## Return Type
`void`

