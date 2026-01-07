# Method: `delete`

## Description

Deletes this [File].

 If [recursive] is `false`:

  * If [path] corresponds to a regular file, named pipe or socket, then
    that path is deleted. If [path] corresponds to a link, and that link
    resolves to a file, then the link at [path] will be deleted. In all
    other cases, [delete] completes with a [FileSystemException].

 If [recursive] is `true`:

  * The [FileSystemEntity] at [path] is deleted regardless of type. If
    [path] corresponds to a file or link, then that file or link is
    deleted. If [path] corresponds to a directory, then it and all
    sub-directories and files in those directories are deleted. Links
    are not followed when deleting recursively. Only the link is deleted,
    not its target. This behavior allows [delete] to be used to
    unconditionally delete any file system object.

 If this [File] cannot be deleted, then [delete] completes with a
 [FileSystemException].

## Return Type
`Future&lt;FileSystemEntity&gt;`

## Parameters

- ``: `dynamic`
