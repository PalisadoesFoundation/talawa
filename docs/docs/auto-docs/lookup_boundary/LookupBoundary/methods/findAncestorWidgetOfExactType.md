# Method: `findAncestorWidgetOfExactType`

## Description

Returns the nearest ancestor widget of the given type `T` within the
 current [LookupBoundary] of `context`.

 `T` must be the type of a concrete [Widget] subclass.

 This method behaves exactly like
 [BuildContext.findAncestorWidgetOfExactType], except it only considers
 [Widget]s of the specified type `T` between the provided [BuildContext]
 and its closest [LookupBoundary] ancestor. [Widget]s past that
 [LookupBoundary] are invisible to this method. The root of the tree is
 treated as an implicit lookup boundary.

 

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
