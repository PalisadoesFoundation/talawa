# Method: `of`

## Description

Returns the [focusNode] of the [Focus] that most tightly encloses the
 given [BuildContext].

 If no [Focus] node is found before reaching the nearest [FocusScope]
 widget, or there is no [Focus] widget in the context, then this method
 will throw an exception.

 

 See also:

 * [maybeOf], which is similar to this function, but will return null
   instead of throwing if it doesn't find a [Focus] node.

## Return Type
`FocusNode`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
- ``: `dynamic`
