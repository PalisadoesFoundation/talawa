# Overview for `SecurityContext`

## Description

The object containing the certificates to trust when making
 a secure client connection, and the certificate chain and
 private key to serve from a secure server.

 The [SecureSocket]  and [SecureServerSocket] classes take a SecurityContext
 as an argument to their connect and bind methods.

 Certificates and keys can be added to a SecurityContext from either PEM
 or PKCS12 containers.

 iOS note: Some methods to add, remove, and inspect certificates are not yet
 implemented. However, the platform's built-in trusted certificates can
 be used, by way of [SecurityContext.defaultContext].

## Members

- **allowLegacyUnsafeRenegotiation**: `bool`
  If `true`, the [SecurityContext] will allow TLS renegotiation.
 Renegotiation is only supported as a client and the HelloRequest must be
 received at a quiet point in the application protocol. This is sufficient
 to support the legacy use case of requesting a new client certificate
 between an HTTP request and response in (unpipelined) HTTP/1.1.
 NOTE: Renegotiation is an extremely problematic protocol feature and
 should only be used to communicate with legacy servers in environments
 where it is known to be safe.

- **minimumTlsProtocolVersion**: `TlsProtocolVersion`
  The minimum TLS version to use when establishing a secure connection.

 If the peer does not support `minimumTlsProtocolVersion` or later
 then [SecureSocket.connect] will throw a [TlsException].

 If the value is changed, it will only affect new connections. Existing
 connections will continue to use the protocol that was negotiated with the
 peer.

 The default value is [TlsProtocolVersion.tls1_2].

## Constructors

### Unnamed Constructor
Creates a new [SecurityContext].

 By default, the created [SecurityContext] contains no keys or certificates.
 These can be added by calling the methods of this class.

 If [withTrustedRoots] is passed as `true`, the [SecurityContext] will be
 seeded by the trusted root certificates provided as explained below. To
 obtain a [SecurityContext] containing trusted root certificates,
 [SecurityContext.defaultContext] is usually sufficient, and should
 be used instead. However, if the [SecurityContext] containing the trusted
 root certificates must be modified per-connection, then [withTrustedRoots]
 should be used.

