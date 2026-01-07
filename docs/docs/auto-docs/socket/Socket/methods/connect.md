# Method: `connect`

## Description

Creates a new socket connection to the host and port and returns a [Future]
 that will complete with either a [Socket] once connected or an error
 if the host-lookup or connection failed.

 [host] can either be a [String] or an [InternetAddress]. If [host] is a
 [String], [connect] will perform a [InternetAddress.lookup] and try
 all returned [InternetAddress]es, until connected. Unless a
 connection was established, the error from the first failing connection is
 returned.

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
`Future&lt;Socket&gt;`

## Parameters

- `host`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
