# Method: `contentLength`

## Description

Returns the content length of the response body. Returns -1 if the size of
 the response body is not known in advance.

 If the content length needs to be set, it must be set before the
 body is written to. Setting the content length after writing to the body
 will throw a `StateError`.

## Return Type
`int`

