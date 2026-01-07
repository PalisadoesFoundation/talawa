# Method: `statSync`

## Description

Synchronously calls the operating system's `` function on [path].

 Identical to `FileStat.statSync(this.path)`.

 Returns a [FileStat] object containing the data returned by ``.

 If [path] is a symbolic link then it is resolved and results for the
 resulting file are returned.

 If the call fails, returns a [FileStat] object with `.type` set to
 [FileSystemEntityType.notFound] and the other fields invalid.

## Return Type
`FileStat`

