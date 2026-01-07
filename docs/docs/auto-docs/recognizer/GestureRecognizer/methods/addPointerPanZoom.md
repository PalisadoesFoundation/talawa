# Method: `addPointerPanZoom`

## Description

Registers a new pointer pan/zoom that might be relevant to this gesture
 detector.

 A pointer pan/zoom is a stream of events that conveys data covering
 pan, zoom, and rotate data from a multi-finger trackpad gesture.

 The owner of this gesture recognizer calls  with the
 PointerPanZoomStartEvent of each pointer that should be considered for
 this gesture.

 It's the GestureRecognizer's responsibility to then add itself
 to the global pointer router (see [PointerRouter]) to receive
 subsequent events for this pointer, and to add the pointer to
 the global gesture arena manager (see [GestureArenaManager]) to track
 that pointer.

 This method is called for each and all pointers being added. In
 most cases, you want to override [addAllowedPointerPanZoom] instead.

## Return Type
`void`

## Parameters

- `event`: `PointerPanZoomStartEvent`
