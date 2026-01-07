# Method: `redirect`

## Description

Respond with a redirect to [location].

 The URI in [location] should be absolute, but there are no checks
 to enforce that.

 By default the HTTP status code `HttpStatus.movedTemporarily`
 (`302`) is used for the redirect, but an alternative one can be
 specified using the [status] argument.

 This method will also call `close`, and the returned future is
 the future returned by `close`.

## Return Type
`Future`

## Parameters

- `location`: `Uri`
- ``: `dynamic`
