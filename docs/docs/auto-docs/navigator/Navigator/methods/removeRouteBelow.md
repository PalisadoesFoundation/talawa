# Method: `removeRouteBelow`

## Description

Immediately remove a route from the navigator that most tightly encloses
 the given context, and [Route.dispose] it. The route to be removed is the
 one below the given `anchorRoute`.

 
 No animations are run as a result of this method call.

 The routes below and above the removed route are notified (see
 [Route.didChangeNext] and [Route.didChangePrevious]). If the [Navigator]
 has any [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didRemove]). The removed route is disposed with its
 future completed.

 The given `anchorRoute` must be in the history and must have a route below
 it; this method will throw an exception if it is not or does not.

 If non-null, `result` will be used as the result of the route that is
 removed; the future that had been returned from pushing the removed route
 will complete with `result`. If provided, must match the type argument of
 the class of the popped route (`T`).

 The `T` type argument is the type of the return value of the popped route.

 The type of `result`, if provided, must match the type argument of the
 class of the removed route (`T`).

 Ongoing gestures within the current route are canceled.
 

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `anchorRoute`: `Route&lt;T&gt;`
- ``: `dynamic`
