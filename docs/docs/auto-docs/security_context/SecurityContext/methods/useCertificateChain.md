# Method: `useCertificateChain`

## Description

Sets the chain of X509 certificates served by [SecureServerSocket]
 when making secure connections, including the server certificate.

 [file] is a PEM or PKCS12 file containing X509 certificates, starting with
 the root authority and intermediate authorities forming the signed
 chain to the server certificate, and ending with the server certificate.
 The private key for the server certificate is set by [usePrivateKey]. For
 PKCS12 files, [password] is the password for the file. For PEM files,
 [password] is ignored. Assuming it is well-formatted, all
 other contents of [file] are ignored.

 NB: This function calls [File.readAsBytesSync], and will block on file IO.
 Prefer using [useCertificateChainBytes].

 iOS note: As noted above, [usePrivateKey] does the job of both
 that call and this one. On iOS, this call is a no-op.

## Return Type
`void`

## Parameters

- `file`: `String`
- ``: `dynamic`
