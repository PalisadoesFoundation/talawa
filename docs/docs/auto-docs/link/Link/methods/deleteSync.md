# Method: `deleteSync`

## Description

Synchronously deletes this [Link].

 If [recursive] is `false`:

  * If [path] corresponds to a link then that path is deleted. Otherwise,
    [delete] throws a [FileSystemException].

 If [recursive] is `true`:

  * The [FileSystemEntity] at [path] is deleted regardless of type. If
    [path] corresponds to a file or link, then that file or link is
    deleted. If [path] corresponds to a directory, then it and all
    sub-directories and files in those directories are deleted. Links
    are not followed when deleting recursively. Only the link is deleted,
    not its target. This behavior allows [delete] to be used to
    unconditionally delete any file system object.

 If this [Link] cannot be deleted, then [delete] throws a
 [FileSystemException].

## Return Type
`void`

## Parameters

- ``: `dynamic`
