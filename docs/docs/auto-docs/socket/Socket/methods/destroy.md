# Method: `destroy`

## Description

Destroys the socket in both directions.

 Calling [destroy] will make the send a close event on the stream
 and will no longer react on data being piped to it.

 Call [close] (inherited from [IOSink]) to only close the [Socket]
 for sending data.

## Return Type
`void`

