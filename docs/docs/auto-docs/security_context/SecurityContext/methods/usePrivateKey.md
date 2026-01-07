# Method: `usePrivateKey`

## Description

Sets the private key for a server certificate or client certificate.

 A secure connection using this SecurityContext will use this key with
 the server or client certificate to sign and decrypt messages.
 [file] is the path to a PEM or PKCS12 file containing an encrypted
 private key, encrypted with [password]. Assuming it is well-formatted, all
 other contents of [file] are ignored. An unencrypted file can be used,
 but this is not usual.

 NB: This function calls [File.readAsBytesSync], and will block on file IO.
 Prefer using [usePrivateKeyBytes].

 iOS note: Only PKCS12 data is supported. It should contain both the private
 key and the certificate chain. On iOS one call to [usePrivateKey] with this
 data is used instead of two calls to [useCertificateChain] and
 [usePrivateKey].

## Return Type
`void`

## Parameters

- `file`: `String`
- ``: `dynamic`
