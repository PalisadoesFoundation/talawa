# Method: `bind`

## Description

Listens on a given address and port.

 When the returned future completes, the server socket is bound
 to the given [address] and [port] and has started listening on it.

 The [address] can either be a [String] or an
 [InternetAddress]. If [address] is a [String], [bind] will
 perform a [InternetAddress.lookup] and use the first value in the
 list. To listen on the loopback adapter, which will allow only
 incoming connections from the local host, use the value
 [InternetAddress.loopbackIPv4] or
 [InternetAddress.loopbackIPv6]. To allow for incoming
 connection from the network use either one of the values
 [InternetAddress.anyIPv4] or [InternetAddress.anyIPv6] to
 bind to all interfaces or the IP address of a specific interface.

 If [port] has the value `0`, an ephemeral port will be chosen by
 the system. The actual port used can be retrieved using the
 [port] getter.

 The optional argument [backlog] can be used to specify the listen
 backlog for the underlying OS listen setup. If [backlog] has the
 value of `0` (the default) a reasonable value will be chosen by
 the system.

 Incoming client connections are promoted to secure connections, using
 the server certificate and key set in [context].

 The [address] must be given as a numeric address, not a host name.

 To request or require that clients authenticate by providing an SSL (TLS)
 client certificate, set the optional parameter [requestClientCertificate]
 or [requireClientCertificate] to true.  Requiring a certificate implies
 requesting a certificate, so setting both is redundant.
 To check whether a client certificate was received, check
 [SecureSocket.peerCertificate] after connecting.  If no certificate
 was received, the result will be null.

 [supportedProtocols] is an optional list of protocols (in decreasing
 order of preference) to use during the ALPN protocol negotiation with
 clients.  Example values are "http/1.1" or "h2".  The selected protocol
 can be obtained via [SecureSocket.selectedProtocol].

 The optional argument [shared] specifies whether additional
 [SecureServerSocket] objects can bind to the same combination of [address],
 [port] and [v6Only].  If [shared] is `true` and more [SecureServerSocket]s
 from this isolate or other isolates are bound to the same port, then the
 incoming connections will be distributed among all the bound
 `SecureServerSocket`s. Connections can be distributed over multiple
 isolates this way.

## Return Type
`Future&lt;SecureServerSocket&gt;`

## Parameters

- `address`: `dynamic`
- `port`: `int`
- `context`: `SecurityContext?`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
