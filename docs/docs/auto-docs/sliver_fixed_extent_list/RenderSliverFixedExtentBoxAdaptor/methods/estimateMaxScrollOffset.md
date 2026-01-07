# Method: `estimateMaxScrollOffset`

## Description

Called to estimate the total scrollable extents of this object.

 Must return the total distance from the start of the child with the
 earliest possible index to the end of the child with the last possible
 index.

 By default, defers to [RenderSliverBoxChildManager.estimateMaxScrollOffset].

 See also:

  * [computeMaxScrollOffset], which is similar but must provide a precise
    value.

## Return Type
`double`

## Parameters

- `constraints`: `SliverConstraints`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
