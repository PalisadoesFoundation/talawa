# Method: `removeChild`

## Description

Remove the given child from the child list.

 Called by [RenderSliverMultiBoxAdaptor.collectGarbage], which itself is
 called from [RenderSliverMultiBoxAdaptor]'s `performLayout`.

 The index of the given child can be obtained using the
 [RenderSliverMultiBoxAdaptor.indexOf] method, which reads it from the
 [SliverMultiBoxAdaptorParentData.index] field of the child's
 [RenderObject.parentData].

## Return Type
`void`

## Parameters

- `child`: `RenderBox`
