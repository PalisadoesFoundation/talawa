# Method: `readSync`

## Description

Reads up to [bytes] bytes from the socket.

 Blocks and waits for a response of up to a specified number of bytes
 sent by the socket. [bytes] specifies the maximum number of bytes to
 be read. Returns the list of bytes read, which could be less than the
 value specified by [bytes].

## Return Type
`List&lt;int&gt;?`

## Parameters

- `bytes`: `int`
