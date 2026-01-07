# Method: `secureServer`

## Description

Initiates TLS on an existing server connection.

 Takes an already connected [socket] and starts server side TLS
 handshake to make the communication secure. When the returned
 future completes the [RawSecureSocket] has completed the TLS
 handshake. Using this function requires that the other end of the
 connection is going to start the TLS handshake.

 If the [socket] already has a subscription, pass the existing
 subscription in the [subscription] parameter. The [secureServer]
 operation will take over the subscription by replacing the
 handlers with it own secure processing. The caller must not touch
 this subscription anymore. Passing a paused subscription is an
 error.

 If some of the data of the TLS handshake has already been read
 from the socket this data can be passed in the [bufferedData]
 parameter. This data will be processed before any other data
 available on the socket.

 See [RawSecureServerSocket.bind] for more information on the
 arguments.

## Return Type
`Future&lt;RawSecureSocket&gt;`

## Parameters

- `socket`: `RawSocket`
- `context`: `SecurityContext?`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
