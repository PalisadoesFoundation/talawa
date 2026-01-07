# Method: `getRawOption`

## Description

Reads low level information about the [RawSocket].

 See [RawSocketOption] for available options.

 Returns the [RawSocketOption.value] on success.

 Throws an [OSError] on failure and a [SocketException] if the socket has
 been destroyed or upgraded to a secure socket.

## Return Type
`Uint8List`

## Parameters

- `option`: `RawSocketOption`
