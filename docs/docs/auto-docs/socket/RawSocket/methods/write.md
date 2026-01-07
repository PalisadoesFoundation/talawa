# Method: `write`

## Description

Writes up to [count] bytes of the buffer from [offset] buffer offset to
 the socket.

 The number of successfully written bytes is returned. This function is
 non-blocking and will only write data if buffer space is available in
 the socket. This means that the number of successfully written bytes may
 be less than `count` or even 0.

 Transmission of the buffer may be delayed unless
 [SocketOption.tcpNoDelay] is set with [RawSocket.setOption].

 The default value for [offset] is 0, and the default value for [count] is
 `buffer.length - offset`.

## Return Type
`int`

## Parameters

- `buffer`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
