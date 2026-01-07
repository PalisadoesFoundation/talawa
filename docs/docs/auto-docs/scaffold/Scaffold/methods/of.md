# Method: `of`

## Description

Finds the [ScaffoldState] from the closest instance of this class that
 encloses the given context.

 If no instance of this class encloses the given context, will cause an
 assert in debug mode, and throw an exception in release mode.

 This method can be expensive (it walks the element tree).

 
 Typical usage of the [Scaffold.of] function is to call it from within the
 `build` method of a child of a [Scaffold].

 ** See code in examples/api/lib/material/scaffold/scaffold.of.0.dart **
 

 
 When the [Scaffold] is actually created in the same `build` function, the
 `context` argument to the `build` function can't be used to find the
 [Scaffold] (since it's "above" the widget being returned in the widget
 tree). In such cases, the following technique with a [Builder] can be used
 to provide a new scope with a [BuildContext] that is "under" the
 [Scaffold]:

 ** See code in examples/api/lib/material/scaffold/scaffold.of.1.dart **
 

 A more efficient solution is to split your build function into several
 widgets. This introduces a new context from which you can obtain the
 [Scaffold]. In this solution, you would have an outer widget that creates
 the [Scaffold] populated by instances of your new inner widgets, and then
 in these inner widgets you would use [Scaffold.of].

 A less elegant but more expedient solution is assign a [GlobalKey] to the
 [Scaffold], then use the `key.currentState` property to obtain the
 [ScaffoldState] rather than using the [Scaffold.of] function.

 If there is no [Scaffold] in scope, then this will throw an exception.
 To return null if there is no [Scaffold], use [maybeOf] instead.

## Return Type
`ScaffoldState`

## Parameters

- `context`: `BuildContext`
