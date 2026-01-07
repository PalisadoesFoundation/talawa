# Method: `toFile`

## Description

Extracts opened file from resource handle.

 This can also be used when receiving stdin and stdout handles and read
 and write pipes.

 Since the [ResourceHandle] represents a single OS resource,
 none of [toFile], [toSocket], [toRawSocket], or [toRawDatagramSocket],
 [toReadPipe], [toWritePipe], can be called after a call to this method.

 If this resource handle is not a file or stdio handle, the behavior of the
 returned [RandomAccessFile] is completely unspecified.
 Be very careful to avoid using a handle incorrectly.

## Return Type
`RandomAccessFile`

