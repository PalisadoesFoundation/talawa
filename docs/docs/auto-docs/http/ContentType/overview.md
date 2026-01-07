# Overview for `ContentType`

## Description

A MIME/IANA media type used as the value of the
 [HttpHeaders.contentTypeHeader] header.

 A [ContentType] is immutable.

## Dependencies

- HeaderValue

## Members

- **text**: `dynamic`
  Content type for plain text using UTF-8 encoding.

     text/plain; charset=utf-8

- **html**: `dynamic`
  Content type for HTML using UTF-8 encoding.

    text/html; charset=utf-8

- **json**: `dynamic`
  Content type for JSON using UTF-8 encoding.

    application/json; charset=utf-8

- **binary**: `dynamic`
  Content type for binary data.

    application/octet-stream

## Constructors

### Unnamed Constructor
Creates a new content type object setting the primary type and
 sub type. The charset and additional parameters can also be set
 using [charset] and [parameters]. If charset is passed and
 [parameters] contains charset as well the passed [charset] will
 override the value in parameters. Keys passed in parameters will be
 converted to lower case. The `charset` entry, whether passed as `charset`
 or in `parameters`, will have its value converted to lower-case.

