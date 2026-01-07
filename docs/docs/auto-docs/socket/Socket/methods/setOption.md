# Method: `setOption`

## Description

Customizes the [RawSocket].

 See [SocketOption] for available options.

 Returns `true` if the option was set successfully, false otherwise.

 Throws a [SocketException] if the socket has been destroyed or upgraded to
 a secure socket.

## Return Type
`bool`

## Parameters

- `option`: `SocketOption`
- `enabled`: `bool`
