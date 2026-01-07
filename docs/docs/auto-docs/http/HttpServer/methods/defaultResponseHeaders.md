# Method: `defaultResponseHeaders`

## Description

Default set of headers added to all response objects.

 By default the following headers are in this set:

     Content-Type: text/plain; charset=utf-8
     X-Frame-Options: SAMEORIGIN
     X-Content-Type-Options: nosniff
     X-XSS-Protection: 1; mode=block

 If the `Server` header is added here and the `serverHeader` is set as
 well then the value of `serverHeader` takes precedence.

## Return Type
`HttpHeaders`

