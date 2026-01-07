# Overview for `ScrollDragController`

## Description

Scrolls a scroll view as the user drags their finger across the screen.

 See also:

  * [DragScrollActivity], which is the activity the scroll view performs
    while a drag is underway.

## Dependencies

- Drag

## Members

- **_delegate**: `ScrollActivityDelegate`
- **onDragCanceled**: `VoidCallback?`
  Called when [dispose] is called.

- **carriedVelocity**: `double?`
  Velocity that was present from a previous [ScrollActivity] when this drag
 began.

- **motionStartDistanceThreshold**: `double?`
  Amount of pixels in either direction the drag has to move by to start
 scroll movement again after each time scrolling came to a stop.

- **_lastNonStationaryTimestamp**: `Duration?`
- **_retainMomentum**: `bool`
- **_offsetSinceLastStop**: `double?`
  Null if already in motion or has no [motionStartDistanceThreshold].

- **momentumRetainStationaryDurationThreshold**: `Duration`
  Maximum amount of time interval the drag can have consecutive stationary
 pointer update events before losing the momentum carried from a previous
 scroll activity.

- **momentumRetainVelocityThresholdFactor**: `double`
  The minimum amount of velocity needed to apply the [carriedVelocity] at
 the end of a drag. Expressed as a factor. For example with a
 [carriedVelocity] of 2000, we will need a velocity of at least 1000 to
 apply the [carriedVelocity] as well. If the velocity does not meet the
 threshold, the [carriedVelocity] is lost. Decided by fair eyeballing
 with the scroll_overlay platform test.

- **motionStoppedDurationThreshold**: `Duration`
  Maximum amount of time interval the drag can have consecutive stationary
 pointer update events before needing to break the
 [motionStartDistanceThreshold] to start motion again.

- **_bigThresholdBreakDistance**: `double`
  The drag distance past which, a [motionStartDistanceThreshold] breaking
 drag is considered a deliberate fling.

- **_kind**: `PointerDeviceKind?`
  The type of input device driving the drag.

- **_lastDetails**: `dynamic`
## Constructors

### Unnamed Constructor
Creates an object that scrolls a scroll view as the user drags their
 finger across the screen.

