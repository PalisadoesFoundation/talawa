# Method: `dispatchObjectEvent`

## Description

Dispatch a new object event to listeners.

 Exceptions thrown by listeners will be caught and reported using
 [FlutterError.reportError].

 Listeners added during an event dispatching, will start being invoked
 for next events, but will be skipped for this event.

 Listeners, removed during an event dispatching, will not be invoked
 after the removal.

 Only call this when [kFlutterMemoryAllocationsEnabled] is true.

## Return Type
`void`

## Parameters

- `event`: `ObjectEvent`
