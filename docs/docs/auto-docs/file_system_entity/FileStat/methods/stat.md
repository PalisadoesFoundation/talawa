# Method: `stat`

## Description

Asynchronously calls the operating system's `` function (or
 equivalent) on [path].

 If [path] is a symbolic link then it is resolved and results for the
 resulting file are returned.

 Returns a [Future] which completes with the same results as [statSync].

## Return Type
`Future&lt;FileStat&gt;`

## Parameters

- `path`: `String`
