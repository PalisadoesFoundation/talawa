# Method: `defaultContext`

## Description

The default security context used by most operation requiring one.

 Secure networking classes with an optional `context` parameter
 use the [defaultContext] object if the parameter is omitted.
 This object can also be accessed, and modified, directly.
 Each isolate has a different [defaultContext] object.
 The [defaultContext] object uses a list of well-known trusted
 certificate authorities as its trusted roots. On Linux and Windows, this
 list is taken from Mozilla, who maintains it as part of Firefox. On,
 MacOS, iOS, and Android, this list comes from the trusted certificates
 stores built into the platforms.

## Return Type
`SecurityContext`

