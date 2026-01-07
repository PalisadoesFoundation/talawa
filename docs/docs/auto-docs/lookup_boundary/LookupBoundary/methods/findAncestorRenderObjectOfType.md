# Method: `findAncestorRenderObjectOfType`

## Description

Returns the [RenderObject] object of the nearest ancestor
 [RenderObjectWidget] widget within the current [LookupBoundary] of
 `context` that is an instance of the given type `T`.

 This method behaves exactly like
 [BuildContext.findAncestorRenderObjectOfType], except it only considers
 [RenderObject]s of the specified type `T` between the provided
 [BuildContext] and its closest [LookupBoundary] ancestor. [RenderObject]s
 past that [LookupBoundary] are invisible to this method. The root of the
 tree is treated as an implicit lookup boundary.

 

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
