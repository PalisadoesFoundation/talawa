# Method: `of`

## Description

The [SliverAnimatedListState] from the closest instance of this class that encloses the given
 context.

 This method is typically used by [SliverAnimatedList] item widgets that
 insert or remove items in response to user input.

 If no [SliverAnimatedList] surrounds the context given, then this function
 will assert in debug mode and throw an exception in release mode.

 This method can be expensive (it walks the element tree).

 This method does not create a dependency, and so will not cause rebuilding
 when the state changes.

 See also:

  * [maybeOf], a similar function that will return null if no
    [SliverAnimatedList] ancestor is found.

## Return Type
`SliverAnimatedListState`

## Parameters

- `context`: `BuildContext`
