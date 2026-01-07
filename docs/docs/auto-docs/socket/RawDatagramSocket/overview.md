# Overview for `RawDatagramSocket`

## Description

An unbuffered interface to a UDP socket.

 The raw datagram socket delivers a [Stream] of [RawSocketEvent]s in the
 same chunks as the underlying operating system receives them.

 Note that the event [RawSocketEvent.readClosed] will never be
 received as an UDP socket cannot be closed by a remote peer.

 It is not the same as a
 [POSIX raw socket](http://man7.org/linux/man-pages/man7/raw.7.html).

 ```dart
 import 'dart:io';
 import 'dart:typed_data';

 void  async 
 ```

## Dependencies

- Stream

## Members

- **readEventsEnabled**: `bool`
  Whether the [RawDatagramSocket] should listen for
 [RawSocketEvent.read] events.

 Default is `true`.

- **writeEventsEnabled**: `bool`
  Whether the [RawDatagramSocket] should listen for
 [RawSocketEvent.write] events.

 Default is `true`.
 This is a one-shot listener, and [writeEventsEnabled] must be set to true
 again to receive another write event.

- **multicastLoopback**: `bool`
  Whether multicast traffic is looped back to the host.

 By default multicast loopback is enabled.

- **multicastHops**: `int`
  The maximum network hops for multicast packages
 originating from this socket.

 For IPv4 this is referred to as TTL (time to live).

 By default this value is 1 causing multicast traffic to stay on
 the local network.

- **multicastInterface**: `NetworkInterface?`
  The network interface used for outgoing multicast packages.

 A value of `null` indicate that the system chooses the network
 interface to use.

 By default this value is `null`

- **broadcastEnabled**: `bool`
  Whether IPv4 broadcast is enabled.

 IPv4 broadcast needs to be enabled by the sender for sending IPv4
 broadcast packages. By default IPv4 broadcast is disabled.

 For IPv6 there is no general broadcast mechanism. Use multicast
 instead.

