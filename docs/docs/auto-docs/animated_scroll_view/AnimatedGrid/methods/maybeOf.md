# Method: `maybeOf`

## Description

The state from the closest instance of this class that encloses the given
 context.

 This method is typically used by [AnimatedGrid] item widgets that insert
 or remove items in response to user input.

 If no [AnimatedGrid] surrounds the context given, then this function will
 return null.

 This method can be expensive (it walks the element tree).

 This method does not create a dependency, and so will not cause rebuilding
 when the state changes.

 See also:

  * [of], a similar function that will throw if no [AnimatedGrid] ancestor
    is found.

## Return Type
`AnimatedGridState?`

## Parameters

- `context`: `BuildContext`
