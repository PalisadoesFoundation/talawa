# Method: `open`

## Description

Opens the file for random access operations.

 Returns a `Future&lt;RandomAccessFile&gt;` that completes with the opened
 random access file. [RandomAccessFile]s must be closed using the
 [RandomAccessFile.close] method.

 Files can be opened in three modes:

 * [FileMode.read]: open the file for reading.

 * [FileMode.write]: open the file for both reading and writing and
 truncate the file to length zero. If the file does not exist the
 file is created.

 * [FileMode.append]: same as [FileMode.write] except that the file is
 not truncated.

 Throws a [FileSystemException] if the operation fails.

## Return Type
`Future&lt;RandomAccessFile&gt;`

## Parameters

- ``: `dynamic`
