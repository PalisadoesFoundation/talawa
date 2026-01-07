# Method: `correctForNewDimensions`

## Description

Verifies that the new content and viewport dimensions are acceptable.

 Called by [applyContentDimensions] to determine its return value.

 Should return true if the current scroll offset is correct given
 the new content and viewport dimensions.

 Otherwise, should call [correctPixels] to correct the scroll
 offset given the new dimensions, and then return false.

 This is only called when [haveDimensions] is true.

 The default implementation defers to [ScrollPhysics.adjustPositionForNewDimensions].

## Return Type
`bool`

## Parameters

- `oldPosition`: `ScrollMetrics`
- `newPosition`: `ScrollMetrics`
