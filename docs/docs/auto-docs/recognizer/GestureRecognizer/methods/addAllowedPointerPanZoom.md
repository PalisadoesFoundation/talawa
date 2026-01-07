# Method: `addAllowedPointerPanZoom`

## Description

Registers a new pointer pan/zoom that's been checked to be allowed by this
 gesture recognizer.

 Subclasses of [GestureRecognizer] are supposed to override this method
 instead of [addPointerPanZoom] because [addPointerPanZoom] will be called for each
 pointer being added while [addAllowedPointerPanZoom] is only called for pointers
 that are allowed by this recognizer.

## Return Type
`void`

## Parameters

- `event`: `PointerPanZoomStartEvent`
