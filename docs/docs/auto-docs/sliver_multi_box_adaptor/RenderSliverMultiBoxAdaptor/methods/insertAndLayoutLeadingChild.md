# Method: `insertAndLayoutLeadingChild`

## Description

Called during layout to create, add, and layout the child before
 [firstChild].

 Calls [RenderSliverBoxChildManager.createChild] to actually create and add
 the child if necessary. The child may instead be obtained from a cache;
 see [SliverMultiBoxAdaptorParentData.keepAlive].

 Returns the new child or null if no child was obtained.

 The child that was previously the first child, as well as any subsequent
 children, may be removed by this call if they have not yet been laid out
 during this layout pass. No child should be added during that call except
 for the one that is created and returned by `createChild`.

## Return Type
`RenderBox?`

## Parameters

- `childConstraints`: `BoxConstraints`
- ``: `dynamic`
