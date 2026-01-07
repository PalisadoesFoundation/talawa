# Method: `toRawDatagramSocket`

## Description

Extracts opened raw datagram socket from resource handle.

 Since the [ResourceHandle] represents a single OS resource,
 none of [toFile], [toSocket], [toRawSocket], or [toRawDatagramSocket],
 [toReadPipe], [toWritePipe], can be called after a call to this method.

 If this resource handle is not a datagram socket handle, the behavior of
 the returned [RawDatagramSocket] is completely unspecified.
 Be very careful to avoid using a handle incorrectly.

## Return Type
`RawDatagramSocket`

