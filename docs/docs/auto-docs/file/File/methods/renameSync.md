# Method: `renameSync`

## Description

Synchronously renames this file.

 Returns a [File] for the renamed file.

 If [newPath] is a relative path, it is resolved against
 the current working directory ([Directory.current]).
 This means that simply changing the name of a file,
 but keeping it the original directory,
 requires creating a new complete path with the new name
 at the end. Example:
 ```dart
 File changeFileNameOnlySync(File file, String newFileName) 
 ```
 On some platforms, a rename operation cannot move a file between
 different file systems. If that is the case, instead [copySync] the
 file to the new location and then [deleteSync] the original.

 If [newPath] identifies an existing file or link, that entity is
 removed first. If [newPath] identifies an existing directory the
 operation throws a [FileSystemException].

## Return Type
`File`

## Parameters

- `newPath`: `String`
