# Method: `peerCertificate`

## Description

Get the peer certificate for a connected RawSecureSocket.  If this
 RawSecureSocket is the server end of a secure socket connection,
 [peerCertificate] will return the client certificate, or null, if no
 client certificate was received.  If it is the client end,
 [peerCertificate] will return the server's certificate.

## Return Type
`X509Certificate?`

