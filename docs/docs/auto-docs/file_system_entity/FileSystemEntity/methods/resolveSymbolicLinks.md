# Method: `resolveSymbolicLinks`

## Description

Resolves the path of a file system object relative to the
 current working directory.

 Resolves all symbolic links on the path and resolves all `..` and `.` path
 segments.

 [resolveSymbolicLinks] uses the operating system's native
 file system API to resolve the path, using the `realpath` function
 on Linux and OS X, and the `GetFinalPathNameByHandle` function on
 Windows. If the path does not point to an existing file system object,
 `resolveSymbolicLinks` throws a `FileSystemException`.

 On Windows the `..` segments are resolved _before_ resolving the symbolic
 link, and on other platforms the symbolic links are _resolved to their
 target_ before applying a `..` that follows.

 To ensure the same behavior on all platforms resolve `..` segments before
 calling `resolveSymbolicLinks`. One way of doing this is with the [Uri]
 class:
 ```dart
 var path = Uri.parse('.').resolveUri(Uri.file(input)).;
 if (path == '') path = '.';
 var resolved = await File(path).;
 print(resolved);
 ```
 since `Uri.resolve` removes `..` segments. This will result in the Windows
 behavior.

 On Windows, attempting to resolve a symbolic link where the link type
 does not match the type of the resolved file system object will cause the
 Future to complete with a [PathAccessException] error.

## Return Type
`Future&lt;String&gt;`

