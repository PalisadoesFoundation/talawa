# Method: `hitTest`

## Description

Called whenever a hit test is being performed on an object that is using
 this custom paint delegate.

 The given point is relative to the same coordinate space as the last
 [paint] call.

 The default behavior is to consider all points to be hits for
 background painters, and no points to be hits for foreground painters.

 Return true if the given position corresponds to a point on the drawn
 image that should be considered a "hit", false if it corresponds to a
 point that should be considered outside the painted image, and null to use
 the default behavior.

## Return Type
`bool?`

## Parameters

- `position`: `Offset`
