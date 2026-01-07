# Overview for `RawSocketEvent`

## Description

Events for the [RawDatagramSocket], [RawSecureSocket], and [RawSocket].

 These event objects are used by the [Stream] behavior of the sockets
 (for example [RawSocket.listen], [RawSocket.forEach])
 when the socket's state change.

 ```dart
 import 'dart:convert';
 import 'dart:io';

 void  async 
 ```

## Members

- **read**: `RawSocketEvent`
  An event indicates the socket is ready to be read.

- **write**: `RawSocketEvent`
  An event indicates the socket is ready to write.

- **readClosed**: `RawSocketEvent`
  An event indicates the reading from the socket is closed

- **closed**: `RawSocketEvent`
  An event indicates the socket is closed.

- **_value**: `int`
## Constructors

### _


#### Parameters

- `_value`: `dynamic`
