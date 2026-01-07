# Method: `of`

## Description

The state from the closest instance of this class that encloses the given
 context.

 This method is typically used by [AnimatedList] item widgets that insert
 or remove items in response to user input.

 If no [AnimatedList] surrounds the context given, then this function will
 assert in debug mode and throw an exception in release mode.

 This method can be expensive (it walks the element tree).

 This method does not create a dependency, and so will not cause rebuilding
 when the state changes.

 See also:

  * [maybeOf], a similar function that will return null if no
    [AnimatedList] ancestor is found.

## Return Type
`AnimatedListState`

## Parameters

- `context`: `BuildContext`
