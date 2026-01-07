# Method: `recommendDeferredLoading`

## Description

Provides a heuristic to determine if expensive frame-bound tasks should be
 deferred.

 The `velocity` parameter may be positive, negative, or zero.

 The `context` parameter normally refers to the [BuildContext] of the widget
 making the call, such as an [Image] widget in a [ListView].

 This can be used to determine whether decoding or fetching complex data
 for the currently visible part of the viewport should be delayed
 to avoid doing work that will not have a chance to appear before a new
 frame is rendered.

 For example, a list of images could use this logic to delay decoding
 images until scrolling is slow enough to actually render the decoded
 image to the screen.

 The default implementation is a heuristic that compares the current
 scroll velocity in local logical pixels to the longest side of the window
 in physical pixels. Implementers can change this heuristic by overriding
 this method and providing their custom physics to the scrollable widget.
 For example, an application that changes the local coordinate system with
 a large perspective transform could provide a more or less aggressive
 heuristic depending on whether the transform was increasing or decreasing
 the overall scale between the global screen and local scrollable
 coordinate systems.

 The default implementation is stateless, and provides a point-in-time
 decision about how fast the scrollable is scrolling. It would always
 return true for a scrollable that is animating back and forth at high
 velocity in a loop. It is assumed that callers will handle such
 a case, or that a custom stateful implementation would be written that
 tracks the sign of the velocity on successive calls.

 Returning true from this method indicates that the current scroll velocity
 is great enough that expensive operations impacting the UI should be
 deferred.

## Return Type
`bool`

## Parameters

- `velocity`: `double`
- `metrics`: `ScrollMetrics`
- `context`: `BuildContext`
