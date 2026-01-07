# Method: `hitTest`

## Description

Determines the set of render objects located at the given position.

 Returns true if the given point is contained in this render object or one
 of its descendants. Adds any render objects that contain the point to the
 given hit test result.

 The [position] argument is in the coordinate system of the render view,
 which is to say, in logical pixels. This is not necessarily the same
 coordinate system as that expected by the root [Layer], which will
 normally be in physical (device) pixels.

## Return Type
`bool`

## Parameters

- `result`: `HitTestResult`
- ``: `dynamic`
