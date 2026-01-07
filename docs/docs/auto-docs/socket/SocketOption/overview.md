# Overview for `SocketOption`

## Description

An option for a socket which is configured using [Socket.setOption].

 The [SocketOption] is used as a parameter to [Socket.setOption] and
 [RawSocket.setOption] to customize the behaviour of the underlying
 socket.

## Members

- **tcpNoDelay**: `SocketOption`
  Enable or disable no-delay on the socket. If tcpNoDelay is enabled, the
 socket will not buffer data internally, but instead write each data chunk
 as an individual TCP packet.

 tcpNoDelay is disabled by default.

- **_ipMulticastLoop**: `SocketOption`
- **_ipMulticastHops**: `SocketOption`
- **_ipMulticastIf**: `SocketOption`
- **_ipBroadcast**: `SocketOption`
- **_value**: `dynamic`
## Constructors

### _


#### Parameters

- `_value`: `dynamic`
