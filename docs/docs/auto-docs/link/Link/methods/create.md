# Method: `create`

## Description

Creates a symbolic link in the file system.

 The created link will point to the path at [target], whether that path
 exists or not.

 Returns a `Future&lt;Link&gt;` that completes with
 the link when it has been created. If the link path already exists,
 the future will complete with an error.

 If [recursive] is `false`, the default, the link is created
 only if all directories in its path exist.
 If [recursive] is `true`, all non-existing parent paths
 are created first. The directories in the path of [target] are
 not affected, unless they are also in [path].

 On the Windows platform, this call will create a true symbolic link
 instead of a junction. Windows treats links to files and links to
 directories as different and non-interchangable kinds of links.
 Each link is either a file-link or a directory-link, and the type is
 chosen when the link is created, and the link then counts as either a
 file or directory for most purposes. Different Win32 API calls are
 used to manipulate each. For example, the `DeleteFile` function is
 used to delete links to files, and `RemoveDirectory` must be used to
 delete links to directories.

 The created Windows symbolic link will match the type of the [target],
 if [target] exists, otherwise a file-link is created. The type of the
 created link will not change if [target] is later replaced by something
 of a different type, but then the link will not be resolvable by
 [resolveSymbolicLinks].

 In order to create a symbolic link on Windows, Dart must be run in
 Administrator mode or the system must have Developer Mode enabled,
 otherwise a [FileSystemException] will be raised with
 `ERROR_PRIVILEGE_NOT_HELD` set as the errno when this call is made.

 On other platforms, the POSIX `` call is used to make a symbolic
 link containing the string [target]. If [target] is a relative path,
 it will be interpreted relative to the directory containing the link.

## Return Type
`Future&lt;Link&gt;`

## Parameters

- `target`: `String`
- ``: `dynamic`
