# Method: `findProxy`

## Description

Sets the function used to resolve the proxy server to be used for
 opening an HTTP connection to the specified `url`. If this
 function is not set, direct connections will always be used.

 The string returned by [f] must be in the format used by browser
 PAC (proxy auto-config) scripts. That is either

     "DIRECT"

 for using a direct connection or

     "PROXY host:port"

 for using the proxy server `host` on port `port`.

 A configuration can contain several configuration elements
 separated by semicolons, e.g.

     "PROXY host:port; PROXY host2:port2; DIRECT"

 The static function [findProxyFromEnvironment] on this class can
 be used to implement proxy server resolving based on environment
 variables.

## Return Type
`void`

## Parameters

- `f`: `String Function(Uri url)?`
