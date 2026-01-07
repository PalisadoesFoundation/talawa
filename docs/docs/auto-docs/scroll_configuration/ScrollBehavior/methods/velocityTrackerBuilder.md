# Method: `velocityTrackerBuilder`

## Description

Specifies the type of velocity tracker to use in the descendant
 [Scrollable]s' drag gesture recognizers, for estimating the velocity of a
 drag gesture.

 This can be used to, for example, apply different fling velocity
 estimation methods on different platforms, in order to match the
 platform's native behavior.

 Typically, the provided [GestureVelocityTrackerBuilder] should return a
 fresh velocity tracker. If null is returned, [Scrollable] creates a new
 [VelocityTracker] to track the newly added pointer that may develop into
 a drag gesture.

 The default implementation provides a new
 [IOSScrollViewFlingVelocityTracker] on iOS and macOS for each new pointer,
 and a new [VelocityTracker] on other platforms for each new pointer.

## Return Type
`GestureVelocityTrackerBuilder`

## Parameters

- `context`: `BuildContext`
