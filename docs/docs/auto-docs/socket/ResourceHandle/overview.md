# Overview for `ResourceHandle`

## Description

A wrapper around OS resource handle so it can be passed via Socket
 as part of [SocketMessage].

## Constructors

### fromFile
Creates wrapper around opened file.

#### Parameters

- `file`: `RandomAccessFile`
### fromSocket
Creates wrapper around opened socket.

#### Parameters

- `socket`: `Socket`
### fromRawSocket
Creates wrapper around opened raw socket.

#### Parameters

- `socket`: `RawSocket`
### fromRawDatagramSocket
Creates wrapper around opened raw datagram socket.

#### Parameters

- `socket`: `RawDatagramSocket`
### fromStdin
Creates wrapper around current stdin.

#### Parameters

- `stdin`: `Stdin`
### fromStdout
Creates wrapper around current stdout.

#### Parameters

- `stdout`: `Stdout`
### fromReadPipe


#### Parameters

- `pipe`: `ReadPipe`
### fromWritePipe


#### Parameters

- `pipe`: `WritePipe`
