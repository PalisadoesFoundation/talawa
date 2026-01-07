# Method: `writeAsString`

## Description

Writes a string to a file.

 Opens the file, writes the string in the given encoding, and closes the
 file. Returns a `Future&lt;File&gt;` that completes with this [File] object
 once the entire operation has completed.

 By default [writeAsString] creates the file for writing and truncates the
 file if it already exists. In order to append the bytes to an existing
 file, pass [FileMode.append] as the optional mode parameter.

 If the argument [flush] is set to `true`, the data written will be
 flushed to the file system before the returned future completes.

 This method does not transform newline characters (`"\n"`) to the
 platform conventional line ending (e.g. `"\r\n"` on Windows). Use
 [Platform.lineTerminator] to separate lines in [contents] if platform
 conventional line endings are needed.

## Return Type
`Future&lt;File&gt;`

## Parameters

- `contents`: `String`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
