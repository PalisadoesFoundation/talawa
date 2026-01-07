# Method: `resize`

## Description

Changes the capacity of the queue associated with the given channel.

 This could result in the dropping of messages if newSize is less
 than the current length of the queue.

 This is expected to be called by platform-specific plugin code (indirectly
 via the control channel), not by code on the framework side. See
 [handleMessage].

 Calling this from framework code is redundant since by the time framework
 code can be running, it can just subscribe to the relevant channel and
 there is therefore no need for any buffering.

## Return Type
`void`

## Parameters

- `name`: `String`
- `newSize`: `int`
