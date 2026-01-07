# Method: `addOnLastListenerRemovedCallback`

## Description

Adds a callback to call when [removeListener] results in an empty
 list of listeners and there are no [keepAlive] handles outstanding.

 This callback will never fire if [removeListener] is never called.

## Return Type
`void`

## Parameters

- `callback`: `VoidCallback`
