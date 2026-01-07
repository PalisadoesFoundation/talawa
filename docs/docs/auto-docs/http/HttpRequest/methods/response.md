# Method: `response`

## Description

The [HttpResponse] object, used for sending back the response to the
 client.

 If the [contentLength] of the body isn't 0, and the body isn't being read,
 any write calls on the [HttpResponse] automatically drain the request
 body.

## Return Type
`HttpResponse`

