# Method: `resolvePackageUri`

## Description

Resolves a `package:` URI to its actual location.

 Returns the actual location of the file or directory specified by the
 [packageUri] `package:` URI.

 If the [packageUri] is not a `package:` URI, it's returned as-is.

 Returns `null` if [packageUri] is a `package:` URI, but either
 the current package configuration does not have a configuration
 for the package name of the URI, or
 the URI is not valid (doesn't start with `package:valid_package_name/`),

 A `package:` URI is resolved to its actual location based on
 a package resolution configuration (see [packageConfig])
 which specifies how to find the actual location of the file or directory
 that the `package:` URI points to.

 The actual location corresponding to a `package:` URI is always a
 non-`package:` URI, typically a `file:` or possibly `http:` URI.

 A program may be run in a way where source files are not available,
 and if so, the returned URI may not correspond to the actual file or
 directory or be `null`.

## Return Type
`Future<Uri?>`

## Parameters

- `packageUri`: `Uri`
