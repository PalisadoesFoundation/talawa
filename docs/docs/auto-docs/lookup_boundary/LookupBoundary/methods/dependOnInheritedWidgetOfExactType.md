# Method: `dependOnInheritedWidgetOfExactType`

## Description

Obtains the nearest widget of the given type `T` within the current
 [LookupBoundary] of `context`, which must be the type of a concrete
 [InheritedWidget] subclass, and registers the provided build `context`
 with that widget such that when that widget changes (or a new widget of
 that type is introduced, or the widget goes away), the build context is
 rebuilt so that it can obtain new values from that widget.

 This method behaves exactly like
 [BuildContext.dependOnInheritedWidgetOfExactType], except it only
 considers [InheritedWidget]s of the specified type `T` between the
 provided [BuildContext] and its closest [LookupBoundary] ancestor.
 [InheritedWidget]s past that [LookupBoundary] are invisible to this
 method. The root of the tree is treated as an implicit lookup boundary.

 

## Return Type
`T?`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
