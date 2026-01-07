# Method: `setClientAuthorities`

## Description

Sets the list of authority names that a [SecureServerSocket] will advertise
 as accepted when requesting a client certificate from a connecting
 client.

 The [file] is a PEM or PKCS12 file containing the accepted signing
 authority certificates - the authority names are extracted from the
 certificates. For PKCS12 files, [password] is the password for the file.
 For PEM files, [password] is ignored. Assuming it is well-formatted, all
 other contents of [file] are ignored.

 NB: This function calls [File.readAsBytesSync], and will block on file IO.
 Prefer using [setClientAuthoritiesBytes].

 iOS note: This call is not supported.

## Return Type
`void`

## Parameters

- `file`: `String`
- ``: `dynamic`
