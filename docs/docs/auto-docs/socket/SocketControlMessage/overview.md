# Overview for `SocketControlMessage`

## Description

Control message part of the [SocketMessage] received by a call to
 [RawSocket.readMessage].

 Control messages could carry different information including
 [ResourceHandle]. If [ResourceHandle]s are available as part of this message,
 they can be extracted via [extractHandles].

## Constructors

### fromHandles
Creates a control message containing the provided [handles].

 This is used by the sender when it sends handles across the socket.
 Receiver can extract the handles from the message using [extractHandles].

#### Parameters

- `handles`: `List&lt;ResourceHandle&gt;`
