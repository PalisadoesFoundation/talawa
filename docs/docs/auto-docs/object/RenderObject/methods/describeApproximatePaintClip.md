# Method: `describeApproximatePaintClip`

## Description

Returns a rect in this object's coordinate system that describes
 the approximate bounding box of the clip rect that would be
 applied to the given child during the paint phase, if any.

 Returns null if the child would not be clipped.

 This is used in the semantics phase to avoid including children
 that are not physically visible.

 RenderObjects that respect a [Clip] behavior when painting _must_ respect
 that same behavior when describing this value. For example, if passing
 [Clip.none] to [PaintingContext.pushClipRect] as the `clipBehavior`, then
 the implementation of this method must return null.

## Return Type
`Rect?`

## Parameters

- `child`: `RenderObject`
