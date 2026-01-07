# Method: `typeSync`

## Description

Synchronously finds the type of file system object that a path points to.

 Returns [FileSystemEntityType.notFound] if [path] does not point to a file
 system object or if any other error occurs in looking up the path.

 If [path] points to a link and [followLinks] is `true` then the result
 will be for the file system object that the link points to. If that
 object does not exist then the result will be
 [FileSystemEntityType.notFound]. If [path] points to a link and
 [followLinks] is `false` then the result will be
 [FileSystemEntityType.link].

## Return Type
`FileSystemEntityType`

## Parameters

- `path`: `String`
- ``: `dynamic`
