# Method: `insertAndLayoutChild`

## Description

Called during layout to create, add, and layout the child after
 the given child.

 Calls [RenderSliverBoxChildManager.createChild] to actually create and add
 the child if necessary. The child may instead be obtained from a cache;
 see [SliverMultiBoxAdaptorParentData.keepAlive].

 Returns the new child. It is the responsibility of the caller to configure
 the child's scroll offset.

 Children after the `after` child may be removed in the process. Only the
 new child may be added.

## Return Type
`RenderBox?`

## Parameters

- `childConstraints`: `BoxConstraints`
- ``: `dynamic`
- ``: `dynamic`
