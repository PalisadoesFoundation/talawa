# Method: `secureServer`

## Description

Initiates TLS on an existing server connection.

 Takes an already connected [socket] and starts server side TLS
 handshake to make the communication secure. When the returned
 future completes the [SecureSocket] has completed the TLS
 handshake. Using this function requires that the other end of the
 connection is going to start the TLS handshake.

 If the [socket] already has a subscription, this subscription
 will no longer receive and events. In most cases calling
 [StreamSubscription.pause] on this subscription
 before starting TLS handshake is the right thing to do.

 If some of the data of the TLS handshake has already been read
 from the socket this data can be passed in the [bufferedData]
 parameter. This data will be processed before any other data
 available on the socket.

 See [SecureServerSocket.bind] for more information on the
 arguments.

## Return Type
`Future&lt;SecureSocket&gt;`

## Parameters

- `socket`: `Socket`
- `context`: `SecurityContext?`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
