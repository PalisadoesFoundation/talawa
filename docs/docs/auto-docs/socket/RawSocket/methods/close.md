# Method: `close`

## Description

Closes the socket.

 Returns a future that completes with this socket when the
 underlying connection is completely destroyed.

 Calling [close] will never throw an exception
 and calling it several times is supported. Calling [close] can result in
 a [RawSocketEvent.readClosed] event.

## Return Type
`Future&lt;RawSocket&gt;`

