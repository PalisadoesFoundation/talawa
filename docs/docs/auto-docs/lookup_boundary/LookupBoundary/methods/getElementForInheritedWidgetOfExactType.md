# Method: `getElementForInheritedWidgetOfExactType`

## Description

Obtains the element corresponding to the nearest widget of the given type
 `T` within the current [LookupBoundary] of `context`.

 `T` must be the type of a concrete [InheritedWidget] subclass. Returns
 null if no such element is found.

 This method behaves exactly like
 [BuildContext.getElementForInheritedWidgetOfExactType], except it only
 considers [InheritedWidget]s of the specified type `T` between the
 provided [BuildContext] and its closest [LookupBoundary] ancestor.
 [InheritedWidget]s past that [LookupBoundary] are invisible to this
 method. The root of the tree is treated as an implicit lookup boundary.

 

## Return Type
`InheritedElement?`

## Parameters

- `context`: `BuildContext`
