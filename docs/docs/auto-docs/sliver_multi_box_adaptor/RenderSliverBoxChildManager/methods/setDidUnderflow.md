# Method: `setDidUnderflow`

## Description

Called during layout to indicate whether this object provided insufficient
 children for the [RenderSliverMultiBoxAdaptor] to fill the
 [SliverConstraints.remainingPaintExtent].

 Typically called unconditionally at the start of layout with false and
 then later called with true when the [RenderSliverMultiBoxAdaptor]
 fails to create a child required to fill the
 [SliverConstraints.remainingPaintExtent].

 Useful for subclasses to determine whether newly added children could
 affect the visible contents of the [RenderSliverMultiBoxAdaptor].

## Return Type
`void`

## Parameters

- `value`: `bool`
