# Method: `send`

## Description

Send a binary message to the platform plugins on the given channel.

 Returns a [Future] which completes to the received response, undecoded,
 in binary form.

## Return Type
`Future<ByteData?>?`

## Parameters

- `channel`: `String`
- `message`: `ByteData?`
