# Method: `closeSync`

## Description

Closes the [RawSynchronousSocket].

 Once [closeSync] has been called, attempting to call [readSync],
 [readIntoSync], [writeFromSync], [remoteAddress], and [remotePort] will
 cause a [SocketException] to be thrown.

## Return Type
`void`

