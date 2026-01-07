# Method: `statSync`

## Description

Calls the operating system's `` function (or equivalent) on [path].

 If [path] is a symbolic link then it is resolved and results for the
 resulting file are returned.

 Returns a [FileStat] object containing the data returned by ``.
 If the call fails, returns a [FileStat] object with [FileStat.type] set to
 [FileSystemEntityType.notFound] and the other fields invalid.

## Return Type
`FileStat`

## Parameters

- `path`: `String`
