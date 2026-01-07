# Method: `clearListener`

## Description

Clears the listener for the specified channel.

 When there is no listener, messages on that channel are queued,
 up to [kDefaultBufferSize] (or the size configured via the
 control channel), and then discarded in a first-in-first-out
 fashion.

## Return Type
`void`

## Parameters

- `name`: `String`
