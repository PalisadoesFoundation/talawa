# Method: `canPop`

## Description

Whether the navigator that most tightly encloses the given context can be
 popped.

 
 The initial route cannot be popped off the navigator, which implies that
 this function returns true only if popping the navigator would not remove
 the initial route.

 If there is no [Navigator] in scope, returns false.

 Does not consider anything that might externally prevent popping, such as
 [PopEntry].
 

 See also:

  * [Route.isFirst], which returns true for routes for which [canPop]
    returns false.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
