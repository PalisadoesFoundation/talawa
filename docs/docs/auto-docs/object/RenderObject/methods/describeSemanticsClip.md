# Method: `describeSemanticsClip`

## Description

Returns a rect in this object's coordinate system that describes
 which [SemanticsNode]s produced by the `child` should be included in the
 semantics tree. [SemanticsNode]s from the `child` that are positioned
 outside of this rect will be dropped. Child [SemanticsNode]s that are
 positioned inside this rect, but outside of [describeApproximatePaintClip]
 will be included in the tree marked as hidden. Child [SemanticsNode]s
 that are inside of both rect will be included in the tree as regular
 nodes.

 This method only returns a non-null value if the semantics clip rect
 is different from the rect returned by [describeApproximatePaintClip].
 If the semantics clip rect and the paint clip rect are the same, this
 method returns null.

 A viewport would typically implement this method to include semantic nodes
 in the semantics tree that are currently hidden just before the leading
 or just after the trailing edge. These nodes have to be included in the
 semantics tree to implement implicit accessibility scrolling on iOS where
 the viewport scrolls implicitly when moving the accessibility focus from
 the last visible node in the viewport to the first hidden one.

 See also:

 * [RenderViewportBase.cacheExtent], used by viewports to extend their
   semantics clip beyond their approximate paint clip.

## Return Type
`Rect?`

## Parameters

- `child`: `RenderObject?`
