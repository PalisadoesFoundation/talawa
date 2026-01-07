# Method: `authenticate`

## Description

Sets the function to be called when a site is requesting
 authentication.

 The URL requested, the authentication scheme and the security realm
 from the server are passed in the arguments `f.url`, `f.scheme` and
 `f.realm`.

 The function returns a [Future] which should complete when the
 authentication has been resolved. If credentials cannot be
 provided the [Future] should complete with `false`. If
 credentials are available the function should add these using
 [addCredentials] before completing the [Future] with the value
 `true`.

 If the [Future] completes with `true` the request will be retried
 using the updated credentials, however, the retried request will not
 carry the original request payload. Otherwise response processing will
 continue normally.

 If it is known that the remote server requires authentication for all
 requests, it is advisable to use [addCredentials] directly, or manually
 set the `'authorization'` header on the request to avoid the overhead
 of a failed request, or issues due to missing request payload on retried
 request.

## Return Type
`void`

## Parameters

- `f`: `Future&lt;bool&gt; Function(Uri url, String scheme, String? realm)?`
