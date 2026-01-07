# Method: `bind`

## Description

Binds a socket to the given [host] and [port].

 When the socket is bound and has started listening on [port], the returned
 future completes with the [RawDatagramSocket] of the bound socket.

 The [host] can either be a [String] or an [InternetAddress]. If [host] is a
 [String], [bind] will perform a [InternetAddress.lookup] and use the first
 value in the list. To listen on the loopback interface, which will allow
 only incoming connections from the local host, use the value
 [InternetAddress.loopbackIPv4] or [InternetAddress.loopbackIPv6].
 To allow for incoming connection from any network use either one of
 the values [InternetAddress.anyIPv4] or [InternetAddress.anyIPv6] to
 bind to all interfaces, or use the IP address of a specific interface.

 The [reuseAddress] should be set for all listeners that bind to the same
 address. Otherwise, it will fail with a [SocketException].

 The [reusePort] specifies whether the port can be reused.

 The [ttl] sets `time to live` of a datagram sent on the socket.

## Return Type
`Future&lt;RawDatagramSocket&gt;`

## Parameters

- `host`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
