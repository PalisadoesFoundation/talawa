# Method: `writeAsStringSync`

## Description

Synchronously writes a string to a file.

 Opens the file, writes the string in the given encoding, and closes the
 file.

 By default [writeAsStringSync] creates the file for writing and
 truncates the file if it already exists. In order to append the bytes
 to an existing file, pass [FileMode.append] as the optional mode
 parameter.

 If the [flush] argument is set to `true`, data written will be
 flushed to the file system before returning.

 This method does not transform newline characters (`"\n"`) to the
 platform conventional line ending (e.g. `"\r\n"` on Windows). Use
 [Platform.lineTerminator] to separate lines in [contents] if platform
 conventional line endings are needed.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`void`

## Parameters

- `contents`: `String`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
