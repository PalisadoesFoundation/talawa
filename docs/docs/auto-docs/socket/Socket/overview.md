# Overview for `Socket`

## Description

A TCP connection between two sockets.

 A *socket connection* connects a *local* socket to a *remote* socket.
 Data, as [Uint8List]s, is received by the local socket, made available
 by the [Stream] interface of this class, and can be sent to the remote
 socket through the [IOSink] interface of this class.

 Transmission of the data sent through the [IOSink] interface may be
 delayed unless [SocketOption.tcpNoDelay] is set with
 [Socket.setOption].

## Dependencies

- Stream, IOSink

