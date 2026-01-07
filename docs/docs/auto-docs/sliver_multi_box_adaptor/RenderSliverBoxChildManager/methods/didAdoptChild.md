# Method: `didAdoptChild`

## Description

Called during [RenderSliverMultiBoxAdaptor.adoptChild] or
 [RenderSliverMultiBoxAdaptor.move].

 Subclasses must ensure that the [SliverMultiBoxAdaptorParentData.index]
 field of the child's [RenderObject.parentData] accurately reflects the
 child's index in the child list after this function returns.

## Return Type
`void`

## Parameters

- `child`: `RenderBox`
