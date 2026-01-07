# Method: `identicalSync`

## Description

Synchronously checks whether two paths refer to the same object in the
 file system.

 Comparing a link to its target returns `false`, as does comparing two links
 that point to the same target.  To check the target of a link, use
 Link.target explicitly to fetch it.  Directory links appearing
 inside a path are followed, though, to find the file system object.

 Throws an error if one of the paths points to an object that does not
 exist.

## Return Type
`bool`

## Parameters

- `path1`: `String`
- `path2`: `String`
