# Method: `computeMaxScrollOffset`

## Description

Called to obtain a precise measure of the total scrollable extents of this
 object.

 Must return the precise total distance from the start of the child with
 the earliest possible index to the end of the child with the last possible
 index.

 This is used when no child is available for the index corresponding to the
 current scroll offset, to determine the precise dimensions of the sliver.
 It must return a precise value. It will not be called if the
 [childManager] returns an infinite number of children for positive
 indices.

 If [itemExtentBuilder] is null, multiplies the [itemExtent] by the number
 of children reported by [RenderSliverBoxChildManager.childCount].
 If [itemExtentBuilder] is non-null, sum the extents of the first
 [RenderSliverBoxChildManager.childCount] children.

 See also:

  * [estimateMaxScrollOffset], which is similar but may provide inaccurate
    values.

## Return Type
`double`

## Parameters

- `constraints`: `SliverConstraints`
- `itemExtent`: `double`
