# Method: `maybeOf`

## Description

Retrieves the immediate [Router] ancestor from the given context.

 This method provides access to the delegates in the [Router]. For example,
 this can be used to access the [backButtonDispatcher] of the parent router
 when creating a [ChildBackButtonDispatcher] for a nested [Router].

 If no `Router` ancestor exists for the given context, this will return
 null.

 See also:

  * [of], a similar method that returns a non-nullable value, and will
    throw if no [Router] ancestor exists.

## Return Type
`Router&lt;T&gt;?`

## Parameters

- `context`: `BuildContext`
