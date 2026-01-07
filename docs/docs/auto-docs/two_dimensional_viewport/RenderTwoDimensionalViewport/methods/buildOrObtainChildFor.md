# Method: `buildOrObtainChildFor`

## Description

Returns the child for a given [ChildVicinity], should be called during
 [layoutChildSequence] in order to instantiate or retrieve children.

 This method will build the child if it has not been already, or will reuse
 it if it already exists, whether it was part of the previous frame or kept
 alive.

 Children for the given [ChildVicinity] will be inserted into the active
 children list, and so should be visible, or contained within the
 [cacheExtent].

## Return Type
`RenderBox?`

## Parameters

- `vicinity`: `ChildVicinity`
