# Method: `paintChildren`

## Description

Override to paint the children of the flow.

 Children can be painted in any order, but each child can be painted at
 most once. Although the container clips the children to its own bounds, it
 is more efficient to skip painting a child altogether rather than having
 it paint entirely outside the container's clip.

 To paint a child, call [FlowPaintingContext.paintChild] on the given
 [FlowPaintingContext] (the `context` argument). The given context is valid
 only within the scope of this function call and contains information (such
 as the size of the container) that is useful for picking transformation
 matrices for the children.

 If this function depends on information other than the given context,
 override [shouldRepaint] to indicate when the container should
 relayout.

## Return Type
`void`

## Parameters

- `context`: `FlowPaintingContext`
