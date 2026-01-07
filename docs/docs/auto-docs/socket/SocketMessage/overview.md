# Overview for `SocketMessage`

## Description

A socket message received by a [RawDatagramSocket].

 A socket message consists of [data] bytes and [controlMessages].

## Members

- **data**: `Uint8List`
  The actual bytes of the message.

- **controlMessages**: `List&lt;SocketControlMessage&gt;`
  The control messages sent as part of this socket message.

 This list can be empty.

## Constructors

### Unnamed Constructor


