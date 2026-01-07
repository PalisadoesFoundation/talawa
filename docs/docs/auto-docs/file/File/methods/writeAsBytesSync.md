# Method: `writeAsBytesSync`

## Description

Synchronously writes a list of bytes to a file.

 Opens the file, writes the list of bytes to it and closes the file.

 By default [writeAsBytesSync] creates the file for writing and truncates
 the file if it already exists. In order to append the bytes to an existing
 file, pass [FileMode.append] as the optional mode parameter.

 The elements of [bytes] should be integers in the range 0 to 255.
 Any integer, which is not in that range, is converted to a byte before
 being written. The conversion is equivalent to doing
 `value.toUnsigned(8)`.

 If the [flush] argument is set to `true` data written will be
 flushed to the file system before returning.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`void`

## Parameters

- `bytes`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
