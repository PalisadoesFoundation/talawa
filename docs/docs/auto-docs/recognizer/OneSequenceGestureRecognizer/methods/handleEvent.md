# Method: `handleEvent`

## Description

Called when a pointer event is routed to this recognizer.

 This will be called for every pointer event while the pointer is being
 tracked. Typically, this recognizer will start tracking the pointer in
 [addAllowedPointer], which means that [handleEvent] will be called
 starting with the [PointerDownEvent] that was passed to [addAllowedPointer].

 See also:

  * [startTrackingPointer], which causes pointer events to be routed to
    this recognizer.
  * [stopTrackingPointer], which stops events from being routed to this
    recognizer.
  * [stopTrackingIfPointerNoLongerDown], which conditionally stops events
    from being routed to this recognizer.

## Return Type
`void`

## Parameters

- `event`: `PointerEvent`
