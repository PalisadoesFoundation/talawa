# Method: `bind`

## Description

Listens on a given address and port.

 When the returned future completes the server socket is bound
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

 If an IP version 6 (IPv6) address is used, both IP version 6
 (IPv6) and version 4 (IPv4) connections will be accepted. To
 restrict this to version 6 (IPv6) only, use [v6Only] to set
 version 6 only.

 If [port] has the value `0` an ephemeral port will be chosen by
 the system. The actual port used can be retrieved using the
 [port] getter.

 The optional argument [backlog] can be used to specify the listen
 backlog for the underlying OS listen setup. If [backlog] has the
 value of `0` (the default) a reasonable value will be chosen by
 the system.

 The optional argument [shared] specifies whether additional ServerSocket
 objects can bind to the same combination of [address], [port] and
 [v6Only]. If [shared] is `true` and more server sockets from this
 isolate or other isolates are bound to the port, then the incoming
 connections will be distributed among all the bound server sockets.
 Connections can be distributed over multiple isolates this way.

## Return Type
`Future&lt;ServerSocket&gt;`

## Parameters

- `address`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
