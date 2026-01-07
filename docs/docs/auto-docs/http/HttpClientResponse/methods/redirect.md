# Method: `redirect`

## Description

Redirects this connection to a new URL. The default value for
 [method] is the method for the current request. The default value
 for [url] is the value of the [HttpHeaders.locationHeader] header of
 the current response. All body data must have been read from the
 current response before calling [redirect].

 All headers added to the request will be added to the redirection
 request. However, any body sent with the request will not be
 part of the redirection request.

 If [followLoops] is set to `true`, redirect will follow the redirect,
 even if the URL was already visited. The default value is `false`.

 The method will ignore [HttpClientRequest.maxRedirects]
 and will always perform the redirect.

## Return Type
`Future&lt;HttpClientResponse&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
