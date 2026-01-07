# Method: `badCertificateCallback`

## Description

Sets a callback that will decide whether to accept a secure connection
 with a server certificate that cannot be authenticated by any of our
 trusted root certificates.

 When a secure HTTP request is made, using this HttpClient, and the
 server returns a server certificate that cannot be authenticated, the
 callback is called asynchronously with the [X509Certificate] object and
 the server's hostname and port.  If the value of [badCertificateCallback]
 is `null`, the bad certificate is rejected, as if the callback
 returned `false`

 If the callback returns true, the secure connection is accepted and the
 `Future&lt;HttpClientRequest&gt;` that was returned from the call making the
 request completes with a valid HttpRequest object. If the callback returns
 false, the `Future&lt;HttpClientRequest&gt;` completes with an exception.

 If a bad certificate is received on a connection attempt, the library calls
 the function that was the value of badCertificateCallback at the time
 the request is made, even if the value of badCertificateCallback
 has changed since then.

## Return Type
`void`

## Parameters

- `callback`: `bool Function(X509Certificate cert, String host, int port)?`
