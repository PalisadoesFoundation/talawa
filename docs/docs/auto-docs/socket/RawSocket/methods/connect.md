# Method: `connect`

## Description

Creates a new socket connection to the host and port.

 Returns a [Future] that will complete with either a [RawSocket]
 once connected, or an error if the host-lookup or connection failed.

 The [host] can either be a [String] or an [InternetAddress]. If [host] is a
 [String], [connect] will perform a [InternetAddress.lookup] and try
 all returned [InternetAddress]es, until connected. If IPv4 and IPv6
 addresses are both available then connections over IPv4 are preferred. If
 no connection can be established then the error from the first failing
 connection is returned.

 The argument [sourceAddress] can be used to specify the local
 address to bind when making the connection. The [sourceAddress] can either
 be a [String] or an [InternetAddress]. If a [String] is passed it must
 hold a numeric IP address.

 The [sourcePort] defines the local port to bind to. If [sourcePort] is
 not specified or zero, a port will be chosen.

 The argument [timeout] is used to specify the maximum allowed time to wait
 for a connection to be established. If [timeout] is longer than the system
 level timeout duration, a timeout may occur sooner than specified in
 [timeout]. On timeout, a [SocketException] is thrown and all ongoing
 connection attempts to [host] are cancelled.

## Return Type
`Future&lt;RawSocket&gt;`

## Parameters

- `host`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
