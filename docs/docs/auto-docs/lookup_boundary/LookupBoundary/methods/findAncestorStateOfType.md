# Method: `findAncestorStateOfType`

## Description

Returns the [State] object of the nearest ancestor [StatefulWidget] widget
 within the current [LookupBoundary] of `context` that is an instance of
 the given type `T`.

 This method behaves exactly like
 [BuildContext.findAncestorWidgetOfExactType], except it only considers
 [State] objects of the specified type `T` between the provided
 [BuildContext] and its closest [LookupBoundary] ancestor. [State] objects
 past that [LookupBoundary] are invisible to this method. The root of the
 tree is treated as an implicit lookup boundary.

 

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
