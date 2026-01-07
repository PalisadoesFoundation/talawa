# Method: `shutdown`

## Description

Shuts down the socket in the [direction].

 Calling [shutdown] will never throw an exception
 and calling it several times is supported. Calling
 shutdown with either [SocketDirection.both] or [SocketDirection.receive]
 can result in a [RawSocketEvent.readClosed] event.

 Warning: [SocketDirection.receive] direction is only considered to be
 to be fully shutdown once all available data is drained and
 [RawSocketEvent.readClosed] is dispatched. Shutting down
 [SocketDirection.receive] and [SocketDirection.send] directions separately
 without draining the data will lead to socket staying around until the
 data is drained. This can happen if [readEventsEnabled] is set
 to `false` or if received data is not [read] in response to these
 events. This does not apply to shutting down both directions
 simultaneously using [SocketDirection.both] which will discard all
 received data instead.

## Return Type
`void`

## Parameters

- `direction`: `SocketDirection`
