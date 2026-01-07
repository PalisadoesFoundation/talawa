# Overview for `Pipe`

## Description

An anonymous pipe that can be used to send data in a single direction i.e.
 data written to [write] can be read using [read].

 On macOS and Linux (excluding Android), either the [read] or [write]
 portion of the pipe can be transmitted to another process and used for
 interprocess communication.

 For example:
 ```dart
 final pipe = await Pipe.;
 final socket = await RawSocket.connect(address, 0);
 socket.sendMessage(<SocketControlMessage>[
 SocketControlMessage.fromHandles(
     <ResourceHandle>[ResourceHandle.fromReadPipe(pipe.read)])
 ], 'Hello'.codeUnits);
 pipe.write.add('Hello over pipe!'.codeUnits);
 await pipe.write.;
 await pipe.write.;
 ```

## Constructors

### createSync
Synchronously creates an anonymous pipe.

