# Method: `shutdown`

## Description

Shuts down a socket in the provided direction.

 Calling shutdown will never throw an exception and calling it several times
 is supported. If both [SocketDirection.receive] and [SocketDirection.send]
 directions are closed, the socket is closed completely, the same as if
 [closeSync] has been called.

## Return Type
`void`

## Parameters

- `direction`: `SocketDirection`
