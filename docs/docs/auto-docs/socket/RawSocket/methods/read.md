# Method: `read`

## Description

Read up to [len] bytes from the socket.

 This function is non-blocking and will only return data
 if data is available.
 The number of bytes read can be less than [len] if fewer bytes are
 available for immediate reading. If no data is available `null`
 is returned.

## Return Type
`Uint8List?`

## Parameters

- ``: `dynamic`
