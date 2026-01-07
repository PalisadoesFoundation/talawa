# Method: `layoutChildSequence`

## Description

Determines the size and position of some of the children of the viewport.

 This function is the workhorse of `performLayout` implementations in
 subclasses.

 Layout starts with `child`, proceeds according to the `advance` callback,
 and stops once `advance` returns null.

  * `scrollOffset` is the [SliverConstraints.scrollOffset] to pass the
    first child. The scroll offset is adjusted by
    [SliverGeometry.scrollExtent] for subsequent children.
  * `overlap` is the [SliverConstraints.overlap] to pass the first child.
    The overlay is adjusted by the [SliverGeometry.paintOrigin] and
    [SliverGeometry.paintExtent] for subsequent children.
  * `layoutOffset` is the layout offset at which to place the first child.
    The layout offset is updated by the [SliverGeometry.layoutExtent] for
    subsequent children.
  * `remainingPaintExtent` is [SliverConstraints.remainingPaintExtent] to
    pass the first child. The remaining paint extent is updated by the
    [SliverGeometry.layoutExtent] for subsequent children.
  * `mainAxisExtent` is the [SliverConstraints.viewportMainAxisExtent] to
    pass to each child.
  * `crossAxisExtent` is the [SliverConstraints.crossAxisExtent] to pass to
    each child.
  * `growthDirection` is the [SliverConstraints.growthDirection] to pass to
    each child.

 Returns the first non-zero [SliverGeometry.scrollOffsetCorrection]
 encountered, if any. Otherwise returns 0.0. Typical callers will call this
 function repeatedly until it returns 0.0.

## Return Type
`double`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
