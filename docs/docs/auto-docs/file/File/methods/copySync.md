# Method: `copySync`

## Description

Synchronously copies this file.

 If [newPath] is a relative path, it is resolved against
 the current working directory ([Directory.current]).

 Returns a [File] for the copied file.

 If [newPath] identifies an existing file, that file is
 removed first. If [newPath] identifies an existing directory the
 operation fails and an exception is thrown.

## Return Type
`File`

## Parameters

- `newPath`: `String`
