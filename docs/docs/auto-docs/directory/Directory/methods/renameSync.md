# Method: `renameSync`

## Description

Synchronously renames this directory.

 Returns a [Directory] for the renamed directory.

 If [newPath] identifies an existing directory, then the behavior is
 platform-specific. On all platforms, a [FileSystemException] is thrown
 if the existing directory is not empty. On POSIX systems, if [newPath]
 identifies an existing empty directory then that directory is deleted
 before this directory is renamed.

 If [newPath] identifies an existing file or link the operation
 fails and a [FileSystemException] is thrown.

## Return Type
`Directory`

## Parameters

- `newPath`: `String`
