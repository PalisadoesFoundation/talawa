# Method: `readMessage`

## Description

Reads a message containing up to [count] bytes from the socket.

 This function differs from [read] in that it will also return any
 [SocketControlMessage] that have been sent.

 This function is non-blocking and will only return data
 if data is available.
 The number of bytes read can be less than [count] if fewer bytes are
 available for immediate reading.
 Length of data buffer in [SocketMessage] indicates number of bytes read.

 Returns `null` if no data is available.

 Unsupported by [RawSecureSocket].

 Unsupported on Android, Fuchsia, Windows.

## Return Type
`SocketMessage?`

## Parameters

- ``: `dynamic`
