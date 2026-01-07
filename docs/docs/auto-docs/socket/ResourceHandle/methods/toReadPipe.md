# Method: `toReadPipe`

## Description

Extracts a read pipe from resource handle.

 Since the [ResourceHandle] represents a single OS resource,
 none of [toFile], [toSocket], [toRawSocket], or [toRawDatagramSocket],
 [toReadPipe], [toWritePipe], can be called after a call to this method.

 If this resource handle is not a readable pipe, the behavior of the
 returned [ReadPipe] is completely unspecified.
 Be very careful to avoid using a handle incorrectly.

## Return Type
`ReadPipe`

