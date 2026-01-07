# Overview for `NetworkImageLoadException`

## Description

The exception thrown when the HTTP request to load a network image fails.

## Dependencies

- Exception

## Members

- **statusCode**: `int`
  The HTTP status code from the server.

- **_message**: `String`
  A human-readable error message.

- **uri**: `Uri`
  Resolved URL of the requested image.

## Constructors

### Unnamed Constructor
Creates a [NetworkImageLoadException] with the specified http [statusCode]
 and [uri].

