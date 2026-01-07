# Method: `createChild`

## Description

Called during layout when a new child is needed. The child should be
 inserted into the child list in the appropriate position, after the
 `after` child (at the start of the list if `after` is null). Its index and
 scroll offsets will automatically be set appropriately.

 The `index` argument gives the index of the child to show. It is possible
 for negative indices to be requested. For example: if the user scrolls
 from child 0 to child 10, and then those children get much smaller, and
 then the user scrolls back up again, this method will eventually be asked
 to produce a child for index -1.

 If no child corresponds to `index`, then do nothing.

 Which child is indicated by index zero depends on the [GrowthDirection]
 specified in the `constraints` of the [RenderSliverMultiBoxAdaptor]. For
 example if the children are the alphabet, then if
 [SliverConstraints.growthDirection] is [GrowthDirection.forward] then
 index zero is A, and index 25 is Z. On the other hand if
 [SliverConstraints.growthDirection] is [GrowthDirection.reverse] then
 index zero is Z, and index 25 is A.

 During a call to [createChild] it is valid to remove other children from
 the [RenderSliverMultiBoxAdaptor] object if they were not created during
 this frame and have not yet been updated during this frame. It is not
 valid to add any other children to this render object.

## Return Type
`void`

## Parameters

- `index`: `int`
- ``: `dynamic`
