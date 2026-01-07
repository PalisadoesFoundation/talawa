# Method: `adjustPositionForNewDimensions`

## Description

Describes what the scroll position should be given new viewport dimensions.

 This is called by [ScrollPosition.correctForNewDimensions].

 The arguments consist of the scroll metrics as they stood in the previous
 frame and the scroll metrics as they now stand after the last layout,
 including the position and minimum and maximum scroll extents; a flag
 indicating if the current [ScrollActivity] considers that the user is
 actively scrolling (see [ScrollActivity.isScrolling]); and the current
 velocity of the scroll position, if it is being driven by the scroll
 activity (this is 0.0 during a user gesture) (see
 [ScrollActivity.velocity]).

 The scroll metrics will be identical except for the
 [ScrollMetrics.minScrollExtent] and [ScrollMetrics.maxScrollExtent]. They
 are referred to as the `oldPosition` and `newPosition` (even though they
 both technically have the same "position", in the form of
 [ScrollMetrics.pixels]) because they are generated from the
 [ScrollPosition] before and after updating the scroll extents.

 If the returned value does not exactly match the scroll offset given by
 the `newPosition` argument (see [ScrollMetrics.pixels]), then the
 [ScrollPosition] will call [ScrollPosition.correctPixels] to update the
 new scroll position to the returned value, and layout will be re-run. This
 is expensive. The new value is subject to further manipulation by
 [applyBoundaryConditions].

 If the returned value _does_ match the `newPosition.pixels` scroll offset
 exactly, then [ScrollPosition.applyNewDimensions] will be called next. In
 that case, [applyBoundaryConditions] is not applied to the return value.

 The given [ScrollMetrics] are only valid during this method call. Do not
 keep references to them to use later, as the values may update, may not
 update, or may update to reflect an entirely unrelated scrollable.

 The default implementation returns the [ScrollMetrics.pixels] of the
 `newPosition`, which indicates that the current scroll offset is
 acceptable.

 See also:

  * [RangeMaintainingScrollPhysics], which is enabled by default, and
    which prevents unexpected changes to the content dimensions from
    causing the scroll position to get any further out of bounds.

## Return Type
`double`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
