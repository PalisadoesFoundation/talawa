# Method: `markNeedsPaint`

## Description

Mark this render object as having changed its visual appearance.

 Rather than eagerly updating this render object's display list
 in response to writes, we instead mark the render object as needing to
 paint, which schedules a visual update. As part of the visual update, the
 rendering pipeline will give this render object an opportunity to update
 its display list.

 This mechanism batches the painting work so that multiple sequential
 writes are coalesced, removing redundant computation.

 Once [markNeedsPaint] has been called on a render object,
 [debugNeedsPaint] returns true for that render object until just after
 the pipeline owner has called [paint] on the render object.

 See also:

  * [RepaintBoundary], to scope a subtree of render objects to their own
    layer, thus limiting the number of nodes that [markNeedsPaint] must mark
    dirty.

## Return Type
`void`

