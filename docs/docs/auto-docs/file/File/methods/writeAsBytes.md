# Method: `writeAsBytes`

## Description

Writes a list of bytes to a file.

 Opens the file, writes the list of bytes to it, and closes the file.
 Returns a `Future&lt;File&gt;` that completes with this [File] object once
 the entire operation has completed.

 By default [writeAsBytes] creates the file for writing and truncates the
 file if it already exists. In order to append the bytes to an existing
 file, pass [FileMode.append] as the optional mode parameter.

 The elements of [bytes] should be integers in the range 0 to 255.
 Any integer, which is not in that range, is converted to a byte before
 being written. The conversion is equivalent to doing
 `value.toUnsigned(8)`.

 If the argument [flush] is set to `true`, the data written will be
 flushed to the file system before the returned future completes.

## Return Type
`Future&lt;File&gt;`

## Parameters

- `bytes`: `List&lt;int&gt;`
- ``: `dynamic`
- ``: `dynamic`
