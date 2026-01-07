# Method: `of`

## Description

Returns the [RestorationBucket] inserted into the widget tree by the
 closest ancestor [RestorationScope] of `context`.

 

 This method will assert in debug mode and throw an exception in release
 mode if state restoration is turned off for this subtree.

 Calling this method will create a dependency on the closest
 [RestorationScope] in the [context].

 See also:

 * [RestorationScope.maybeOf], which is similar to this method, but returns
   null if no [RestorationScope] ancestor is found.

## Return Type
`RestorationBucket`

## Parameters

- `context`: `BuildContext`
