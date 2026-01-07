# Overview for `RawSecureSocket`

## Description

`RawSecureSocket` provides a secure (SSL or TLS) network connection.

 Client connections to a server are provided by calling
 RawSecureSocket.connect.  A secure server, created with
 [RawSecureServerSocket], also returns `RawSecureSocket` objects representing
 the server end of a secure connection.
 The certificate provided by the server is checked
 using the trusted certificates set in the [SecurityContext] object.
 The default [SecurityContext] object contains a built-in set of trusted
 root certificates for well-known certificate authorities.

 See [RawSocket] for more information.

## Dependencies

- RawSocket

