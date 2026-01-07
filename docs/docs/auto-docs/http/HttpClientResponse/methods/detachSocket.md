# Method: `detachSocket`

## Description

Detach the underlying socket from the HTTP client. When the
 socket is detached the HTTP client will no longer perform any
 operations on it.

 This is normally used when an HTTP upgrade is negotiated and the
 communication should continue with a different protocol.

## Return Type
`Future&lt;Socket&gt;`

