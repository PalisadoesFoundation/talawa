# Overview for `RawSocket`

## Description

A TCP connection.

 A *socket connection* connects a *local* socket to a *remote* socket.
 Data, as [Uint8List]s, is received by the local socket and made
 available by the [read] method, and can be sent to the remote socket
 through the [write] method.

 The [Stream] interface of this class provides event notification about when
 a certain change has happened, for example when data has become available
 ([RawSocketEvent.read]) or when the remote end has stopped listening
 ([RawSocketEvent.closed]).

## Dependencies

- Stream

## Members

- **readEventsEnabled**: `bool`
  Set or get, if the [RawSocket] should listen for [RawSocketEvent.read]
 and [RawSocketEvent.readClosed] events. Default is `true`.

 Warning: setting [readEventsEnabled] to `false` might prevent socket
 from fully closing when [SocketDirection.receive] and
 [SocketDirection.send] directions are shutdown independently. See
 [shutdown] for more details.

- **writeEventsEnabled**: `bool`
  Set or get, if the [RawSocket] should listen for [RawSocketEvent.write]
 events. Default is `true`.
 This is a one-shot listener, and writeEventsEnabled must be set
 to true again to receive another write event.

