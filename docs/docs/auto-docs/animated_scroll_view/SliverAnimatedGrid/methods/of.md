# Method: `of`

## Description

The state from the closest instance of this class that encloses the given
 context.

 This method is typically used by [SliverAnimatedGrid] item widgets that
 insert or remove items in response to user input.

 If no [SliverAnimatedGrid] surrounds the context given, then this function
 will assert in debug mode and throw an exception in release mode.

 This method can be expensive (it walks the element tree).

 See also:

  * [maybeOf], a similar function that will return null if no
    [SliverAnimatedGrid] ancestor is found.

## Return Type
`SliverAnimatedGridState`

## Parameters

- `context`: `BuildContext`
