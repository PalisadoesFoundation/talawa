# Method: `stopTrackingPointer`

## Description

Stops events related to the given pointer ID from being routed to this recognizer.

 If this function reduces the number of tracked pointers to zero, it will
 call [didStopTrackingLastPointer] synchronously.

 Use [startTrackingPointer] to add the routes in the first place.

## Return Type
`void`

## Parameters

- `pointer`: `int`
