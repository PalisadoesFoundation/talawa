# Method: `maybeOf`

## Description

Returns the [focusNode] of the [Focus] that most tightly encloses the
 given [BuildContext].

 If no [Focus] node is found before reaching the nearest [FocusScope]
 widget, or there is no [Focus] widget in scope, then this method will
 return null.

 
 If `createDependency` is true (which is the default), calling this
 function creates a dependency that will rebuild the given context when the
 focus node gains or loses focus.
 

 See also:

 * [of], which is similar to this function, but will throw an exception if
   it doesn't find a [Focus] node, instead of returning null.

## Return Type
`FocusNode?`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
- ``: `dynamic`
