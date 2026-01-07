# Method: `allowOverflow`

## Description

Toggles whether the channel should show warning messages when discarding
 messages due to overflow.

 This is expected to be called by platform-specific plugin code (indirectly
 via the control channel), not by code on the framework side. See
 [handleMessage].

 Calling this from framework code is redundant since by the time framework
 code can be running, it can just subscribe to the relevant channel and
 there is therefore no need for any messages to overflow.

 This method has no effect in release builds.

## Return Type
`void`

## Parameters

- `name`: `String`
- `allowed`: `bool`
