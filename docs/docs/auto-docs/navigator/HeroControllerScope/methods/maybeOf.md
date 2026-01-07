# Method: `maybeOf`

## Description

Retrieves the [HeroController] from the closest [HeroControllerScope]
 ancestor, or null if none exists.

 Calling this method will create a dependency on the closest
 [HeroControllerScope] in the [context], if there is one.

 See also:

 * [HeroControllerScope.of], which is similar to this method, but asserts
   if no [HeroControllerScope] ancestor is found.

## Return Type
`HeroController?`

## Parameters

- `context`: `BuildContext`
