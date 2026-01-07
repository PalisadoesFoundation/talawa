# Method: `findRootAncestorStateOfType`

## Description

Returns the [State] object of the furthest ancestor [StatefulWidget]
 widget within the current [LookupBoundary] of `context` that is an
 instance of the given type `T`.

 This method behaves exactly like
 [BuildContext.findRootAncestorStateOfType], except it considers the
 closest [LookupBoundary] ancestor of `context` to be the root. [State]
 objects past that [LookupBoundary] are invisible to this method. The root
 of the tree is treated as an implicit lookup boundary.

 

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
