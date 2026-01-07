# Method: `maybeOf`

## Description

The state from the closest instance of this class that encloses the given
 context.

 This method is typically used by [SliverAnimatedGrid] item widgets that
 insert or remove items in response to user input.

 If no [SliverAnimatedGrid] surrounds the context given, then this function
 will return null.

 This method can be expensive (it walks the element tree).

 See also:

  * [of], a similar function that will throw if no [SliverAnimatedGrid]
    ancestor is found.

## Return Type
`SliverAnimatedGridState?`

## Parameters

- `context`: `BuildContext`
