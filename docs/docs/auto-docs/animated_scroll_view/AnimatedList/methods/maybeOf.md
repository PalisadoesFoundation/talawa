# Method: `maybeOf`

## Description

The [AnimatedListState] from the closest instance of [AnimatedList] that encloses the given
 context.

 This method is typically used by [AnimatedList] item widgets that insert
 or remove items in response to user input.

 If no [AnimatedList] surrounds the context given, then this function will
 return null.

 This method can be expensive (it walks the element tree).

 This method does not create a dependency, and so will not cause rebuilding
 when the state changes.

 See also:

  * [of], a similar function that will throw if no [AnimatedList] ancestor
    is found.

## Return Type
`AnimatedListState?`

## Parameters

- `context`: `BuildContext`
