# Method: `updateState`

## Description

Save the release's [state].

 This can be overridden by frontends that may not persist the state to
 disk, and/or may need to call additional update hooks each time the state
 is updated.

## Return Type
`void`

## Parameters

- `state`: `pb.ConductorState`
- ``: `dynamic`
