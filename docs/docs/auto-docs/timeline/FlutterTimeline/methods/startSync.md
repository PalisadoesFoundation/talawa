# Method: `startSync`

## Description

Start a synchronous operation labeled `name`.

 Optionally takes a map of `arguments`. This slice may also optionally be
 associated with a [Flow] event. This operation must be finished by calling
 [finishSync] before returning to the event queue.

 This is a drop-in replacement for [Timeline.startSync].

## Return Type
`void`

## Parameters

- `name`: `String`
- ``: `dynamic`
- ``: `dynamic`
