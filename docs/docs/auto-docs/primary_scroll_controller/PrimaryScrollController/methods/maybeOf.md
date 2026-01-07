# Method: `maybeOf`

## Description

Returns the [ScrollController] most closely associated with the given
 context.

 Returns null if there is no [ScrollController] associated with the given
 context.

 Calling this method will create a dependency on the closest
 [PrimaryScrollController] in the [context], if there is one.

 See also:

 * [PrimaryScrollController.maybeOf], which is similar to this method, but
   asserts if no [PrimaryScrollController] ancestor is found.

## Return Type
`ScrollController?`

## Parameters

- `context`: `BuildContext`
