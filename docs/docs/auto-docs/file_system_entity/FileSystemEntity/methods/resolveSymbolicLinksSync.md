# Method: `resolveSymbolicLinksSync`

## Description

Resolves the path of a file system object relative to the
 current working directory.

 Resolves all symbolic links on the path and resolves all `..` and `.` path
 segments.

 [resolveSymbolicLinksSync] uses the operating system's native
 file system API to resolve the path, using the `realpath` function
 on linux and OS X, and the `GetFinalPathNameByHandle` function on
 Windows. If the path does not point to an existing file system object,
 `resolveSymbolicLinksSync` throws a `FileSystemException`.

 On Windows the `..` segments are resolved _before_ resolving the symbolic
 link, and on other platforms the symbolic links are _resolved to their
 target_ before applying a `..` that follows.

 To ensure the same behavior on all platforms resolve `..` segments before
 calling `resolveSymbolicLinksSync`. One way of doing this is with the [Uri]
 class:
 ```dart
 var path = Uri.parse('.').resolveUri(Uri.file(input)).;
 if (path == '') path = '.';
 var resolved = File(path).;
 print(resolved);
 ```
 since `Uri.resolve` removes `..` segments. This will result in the Windows
 behavior.

 On Windows, a symbolic link is created as either a file link or a
 directory link. Attempting to resolve such a symbolic link requires the
 link type to match the type of the file system object that it points to,
 otherwise it throws a [PathAccessException].

## Return Type
`String`

