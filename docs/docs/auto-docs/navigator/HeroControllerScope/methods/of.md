# Method: `of`

## Description

Retrieves the [HeroController] from the closest [HeroControllerScope]
 ancestor.

 If no ancestor is found, this method will assert in debug mode, and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [HeroControllerScope] in the [context].

 See also:

 * [HeroControllerScope.maybeOf], which is similar to this method, but
   returns null if no [HeroControllerScope] ancestor is found.

## Return Type
`HeroController`

## Parameters

- `context`: `BuildContext`
