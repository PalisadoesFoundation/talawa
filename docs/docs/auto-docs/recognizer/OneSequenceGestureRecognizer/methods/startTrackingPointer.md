# Method: `startTrackingPointer`

## Description

Causes events related to the given pointer ID to be routed to this recognizer.

 The pointer events are transformed according to `transform` and then delivered
 to [handleEvent]. The value for the `transform` argument is usually obtained
 from [PointerDownEvent.transform] to transform the events from the global
 coordinate space into the coordinate space of the event receiver. It may be
 null if no transformation is necessary.

 Use [stopTrackingPointer] to remove the route added by this function.

 This method also adds this recognizer (or its [team] if it's non-null) to
 the gesture arena for the specified pointer.

 This is called by [OneSequenceGestureRecognizer.addAllowedPointer].

## Return Type
`void`

## Parameters

- `pointer`: `int`
- ``: `dynamic`
