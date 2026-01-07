# Method: `copy`

## Description

Copies this file.

 If [newPath] is a relative path, it is resolved against
 the current working directory ([Directory.current]).

 Returns a `Future&lt;File&gt;` that completes
 with a [File] for the copied file.

 If [newPath] identifies an existing file, that file is
 removed first. If [newPath] identifies an existing directory, the
 operation fails and the future completes with an exception.

## Return Type
`Future&lt;File&gt;`

## Parameters

- `newPath`: `String`
