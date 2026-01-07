# Method: `applyBoundaryConditions`

## Description

Determines the overscroll by applying the boundary conditions.

 Called by [ScrollPosition.applyBoundaryConditions], which is called by
 [ScrollPosition.setPixels] just before the [ScrollPosition.pixels] value
 is updated, to determine how much of the offset is to be clamped off and
 sent to [ScrollPosition.didOverscrollBy].

 The `value` argument is guaranteed to not equal the [ScrollMetrics.pixels]
 of the `position` argument when this is called.

 It is possible for this method to be called when the `position` describes
 an already-out-of-bounds position. In that case, the boundary conditions
 should usually only prevent a further increase in the extent to which the
 position is out of bounds, allowing a decrease to be applied successfully,
 so that (for instance) an animation can smoothly snap an out of bounds
 position to the bounds. See [BallisticScrollActivity].

 This method must not clamp parts of the offset that are entirely within
 the bounds described by the given `position`.

 The given `position` is only valid during this method call. Do not keep a
 reference to it to use later, as the values may update, may not update, or
 may update to reflect an entirely unrelated scrollable.

 ## Examples

 [BouncingScrollPhysics] returns zero. In other words, it allows scrolling
 past the boundary unhindered.

 [ClampingScrollPhysics] returns the amount by which the value is beyond
 the position or the boundary, whichever is furthest from the content. In
 other words, it disallows scrolling past the boundary, but allows
 scrolling back from being overscrolled, if for some reason the position
 ends up overscrolled.

## Return Type
`double`

## Parameters

- `position`: `ScrollMetrics`
- `value`: `double`
