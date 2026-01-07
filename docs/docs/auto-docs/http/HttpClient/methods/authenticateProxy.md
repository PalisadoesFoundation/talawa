# Method: `authenticateProxy`

## Description

Sets the function to be called when a proxy is requesting
 authentication.

 Information on the proxy in use, the authentication scheme
 and the security realm for the authentication
 are passed in the arguments `f.host`, `f.port`, `f.scheme` and `f.realm`.

 The function returns a [Future] which should complete when the
 authentication has been resolved. If credentials cannot be
 provided the [Future] should complete with `false`. If
 credentials are available the function should add these using
 [addProxyCredentials] before completing the [Future] with the value
 `true`.

 If the [Future] completes with `true` the request will be retried
 using the updated credentials. Otherwise response processing will
 continue normally.

## Return Type
`void`

## Parameters

- `f`: `Future&lt;bool&gt; Function(String host, int port, String scheme, String? realm)?`
