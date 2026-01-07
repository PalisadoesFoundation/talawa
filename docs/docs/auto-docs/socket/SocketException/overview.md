# Overview for `SocketException`

## Description

Exception thrown when a socket operation fails.

## Dependencies

- IOException

## Members

- **message**: `String`
  Description of the error.

- **osError**: `OSError?`
  The underlying OS error.

 If this exception is not thrown due to an OS error, the value is `null`.

- **address**: `InternetAddress?`
  The address of the socket giving rise to the exception.

 This is either the source or destination address of a socket,
 or it can be `null` if no socket end-point was involved in the cause of
 the exception.

- **port**: `int?`
  The port of the socket giving rise to the exception.

 This is either the source or destination address of a socket,
 or it can be `null` if no socket end-point was involved in the cause of
 the exception.

## Constructors

### Unnamed Constructor
Creates a [SocketException] with the provided values.

### closed
Creates an exception reporting that a socket was used after it was closed.

