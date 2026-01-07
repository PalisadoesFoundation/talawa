# Method: `updateWithEvent`

## Description

Perform a device update for one device according to the given new event.

 The [updateWithEvent] is typically called by [RendererBinding] during the
 handler of a pointer event. All pointer events should call this method,
 and let [MouseTracker] filter which to react to.

 The `hitTestResult` serves as an optional optimization, and is the hit
 test result already performed by [RendererBinding] for other gestures. It
 can be null, but when it's not null, it should be identical to the result
 from directly calling `hitTestInView` given in the constructor (which
 means that it should not use the cached result for [PointerMoveEvent]).

 The [updateWithEvent] is one of the two ways of updating mouse
 states, the other one being [updateAllDevices].

## Return Type
`void`

## Parameters

- `event`: `PointerEvent`
- `hitTestResult`: `HitTestResult?`
