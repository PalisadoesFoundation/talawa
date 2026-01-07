# Method: `sendMessage`

## Description

Writes socket control messages and data bytes to the socket.

 Writes [controlMessages] and up to [count] bytes of [data],
 starting at [offset], to the socket. If [count] is not provided,
 as many bytes as possible are written. Use [write] instead if no control
 messages are required to be sent.

 When sent control messages are received, they are retained until the
 next call to [readMessage], where all currently available control messages
 are provided as part of the returned [SocketMessage].
 Calling [read] will read only data bytes, and will not affect control
 messages.

 The [count] must be positive (greater than zero).

 Returns the number of bytes written, which cannot be greater than
 [count], nor greater than `data.length - offset`.
 Return value of zero indicates that control messages were not sent.

 This function is non-blocking and will only write data
 if buffer space is available in the socket.

 Throws an [OSError] if message could not be sent out.

 Unsupported by [RawSecureSocket].

 Unsupported on Android, Fuchsia, Windows.

## Return Type
`int`

## Parameters

- `controlMessages`: `List&lt;SocketControlMessage&gt;`
- `data`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
