# Method: `of`

## Description

Retrieves the immediate [Router] ancestor from the given context.

 This method provides access to the delegates in the [Router]. For example,
 this can be used to access the [backButtonDispatcher] of the parent router
 when creating a [ChildBackButtonDispatcher] for a nested [Router].

 If no [Router] ancestor exists for the given context, this will assert in
 debug mode, and throw an exception in release mode.

 See also:

  * [maybeOf], which is a similar function, but it will return null instead
    of throwing an exception if no [Router] ancestor exists.

## Return Type
`Router&lt;T&gt;`

## Parameters

- `context`: `BuildContext`
