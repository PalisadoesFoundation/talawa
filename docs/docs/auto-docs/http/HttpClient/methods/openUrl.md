# Method: `openUrl`

## Description

Opens an HTTP connection.

 The HTTP method is specified in [method] and the URL to use in
 [url].

 The `Host` header for the request will be set to the value
 [Uri.host]:[Uri.port] from [url] (if `url.host` is an IP address, it will
 still be used in the `Host` header). This can be overridden through the
 [HttpClientRequest] interface before the request is sent.

 For additional information on the sequence of events during an
 HTTP transaction, and the objects returned by the futures, see
 the overall documentation for the class [HttpClient].

## Return Type
`Future&lt;HttpClientRequest&gt;`

## Parameters

- `method`: `String`
- `url`: `Uri`
