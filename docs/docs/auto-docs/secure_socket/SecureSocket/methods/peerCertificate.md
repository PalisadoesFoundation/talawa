# Method: `peerCertificate`

## Description

The peer certificate for a connected SecureSocket.

 If this [SecureSocket] is the server end of a secure socket connection,
 [peerCertificate] will return the client certificate, or `null` if no
 client certificate was received.  If this socket is the client end,
 [peerCertificate] will return the server's certificate.

## Return Type
`X509Certificate?`

