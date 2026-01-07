# Method: `of`

## Description

Returns the [ScrollController] most closely associated with the given
 context.

 If no ancestor is found, this method will assert in debug mode, and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [PrimaryScrollController] in the [context].

 See also:

 * [PrimaryScrollController.maybeOf], which is similar to this method, but
   returns null if no [PrimaryScrollController] ancestor is found.

## Return Type
`ScrollController`

## Parameters

- `context`: `BuildContext`
