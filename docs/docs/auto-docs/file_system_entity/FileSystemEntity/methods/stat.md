# Method: `stat`

## Description

Calls the operating system's `` function on [path].

 Identical to `FileStat.stat(this.path)`.

 Returns a `Future&lt;FileStat&gt;` object containing the data returned by
 ``.

 If [path] is a symbolic link then it is resolved and results for the
 resulting file are returned.

 If the call fails, completes the future with a [FileStat] object
 with `.type` set to [FileSystemEntityType.notFound] and the other fields
 invalid.

## Return Type
`Future&lt;FileStat&gt;`

