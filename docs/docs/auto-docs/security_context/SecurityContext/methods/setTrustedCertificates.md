# Method: `setTrustedCertificates`

## Description

Add a certificate to the set of trusted X509 certificates
 used by [SecureSocket] client connections.

 [file] is the path to a PEM or PKCS12 file containing X509 certificates,
 usually root certificates from certificate authorities. For PKCS12 files,
 [password] is the password for the file. For PEM files, [password] is
 ignored. Assuming it is well-formatted, all other contents of [file] are
 ignored.

 NB: This function calls [File.readAsBytesSync], and will block on file IO.
 Prefer using [setTrustedCertificatesBytes].

 iOS note: On iOS, this call takes only the bytes for a single DER
 encoded X509 certificate. It may be called multiple times to add
 multiple trusted certificates to the context. A DER encoded certificate
 can be obtained from a PEM encoded certificate by using the openssl tool:
 ```bash
 $ openssl x509 -outform der -in cert.pem -out cert.der
 ```

## Return Type
`void`

## Parameters

- `file`: `String`
- ``: `dynamic`
