# Method: `rename`

## Description

Renames this directory.

 Returns a `Future&lt;Directory&gt;` that completes
 with a [Directory] for the renamed directory.

 If [newPath] identifies an existing directory, then the behavior is
 platform-specific. On all platforms, the future completes with a
 [FileSystemException] if the existing directory is not empty. On POSIX
 systems, if [newPath] identifies an existing empty directory then that
 directory is deleted before this directory is renamed.

 If [newPath] identifies an existing file or link, the operation
 fails and the future completes with a [FileSystemException].

## Return Type
`Future&lt;Directory&gt;`

## Parameters

- `newPath`: `String`
