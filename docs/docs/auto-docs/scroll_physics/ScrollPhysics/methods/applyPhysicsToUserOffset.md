# Method: `applyPhysicsToUserOffset`

## Description

Used by [DragScrollActivity] and other user-driven activities to convert
 an offset in logical pixels as provided by the [DragUpdateDetails] into a
 delta to apply (subtract from the current position) using
 [ScrollActivityDelegate.setPixels].

 This is used by some [ScrollPosition] subclasses to apply friction during
 overscroll situations.

 This method must not adjust parts of the offset that are entirely within
 the bounds described by the given `position`.

 The given `position` is only valid during this method call. Do not keep a
 reference to it to use later, as the values may update, may not update, or
 may update to reflect an entirely unrelated scrollable.

## Return Type
`double`

## Parameters

- `position`: `ScrollMetrics`
- `offset`: `double`
