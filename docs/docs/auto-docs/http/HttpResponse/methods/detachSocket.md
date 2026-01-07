# Method: `detachSocket`

## Description

Detaches the underlying socket from the HTTP server. When the
 socket is detached the HTTP server will no longer perform any
 operations on it.

 This is normally used when an HTTP upgrade request is received
 and the communication should continue with a different protocol.

 If [writeHeaders] is `true`, the status line and [headers] will be written
 to the socket before it's detached. If `false`, the socket is detached
 immediately, without any data written to the socket. Default is `true`.

## Return Type
`Future&lt;Socket&gt;`

## Parameters

- ``: `dynamic`
