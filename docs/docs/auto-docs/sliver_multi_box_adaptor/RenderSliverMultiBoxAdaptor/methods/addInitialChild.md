# Method: `addInitialChild`

## Description

Called during layout to create and add the child with the given index and
 scroll offset.

 Calls [RenderSliverBoxChildManager.createChild] to actually create and add
 the child if necessary. The child may instead be obtained from a cache;
 see [SliverMultiBoxAdaptorParentData.keepAlive].

 Returns false if there was no cached child and `createChild` did not add
 any child, otherwise returns true.

 Does not layout the new child.

 When this is called, there are no visible children, so no children can be
 removed during the call to `createChild`. No child should be added during
 that call either, except for the one that is created and returned by
 `createChild`.

## Return Type
`bool`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
