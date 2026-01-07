# Method: `maybeOf`

## Description

The closest instance of this class that encloses the given context.

 If there is no enclosing [ScrollNotificationObserver] widget, then null is
 returned.

 Calling this method will create a dependency on the closest
 [ScrollNotificationObserver] in the [context], if there is one.

 See also:

 * [ScrollNotificationObserver.of], which is similar to this method, but
   asserts if no [ScrollNotificationObserver] ancestor is found.

## Return Type
`ScrollNotificationObserverState?`

## Parameters

- `context`: `BuildContext`
