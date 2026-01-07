# Method: `of`

## Description

The closest instance of this class that encloses the given context.

 If no ancestor is found, this method will assert in debug mode, and throw
 an exception in release mode.

 Calling this method will create a dependency on the closest
 [ScrollNotificationObserver] in the [context].

 See also:

 * [ScrollNotificationObserver.maybeOf], which is similar to this method,
   but returns null if no [ScrollNotificationObserver] ancestor is found.

## Return Type
`ScrollNotificationObserverState`

## Parameters

- `context`: `BuildContext`
