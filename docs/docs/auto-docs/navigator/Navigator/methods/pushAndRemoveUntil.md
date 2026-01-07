# Method: `pushAndRemoveUntil`

## Description

Push the given route onto the navigator that most tightly encloses the
 given context, and then remove all the previous routes until the
 `predicate` returns true.

 
 The predicate may be applied to the same route more than once if
 [Route.willHandlePopInternally] is true.

 To remove routes until a route with a certain name, use the
 [RoutePredicate] returned from [ModalRoute.withName].

 To remove all the routes below the pushed route, use a [RoutePredicate]
 that always returns false (e.g. `(Route&lt;dynamic&gt; route) => false`).

 The removed routes are removed without being completed, so this method
 does not take a return value argument.

 The newly pushed route and its preceding route are notified for
 [Route.didPush]. After removal, the new route and its new preceding route,
 (the route below the bottommost removed route) are notified through
 [Route.didChangeNext]). If the [Navigator] has any [Navigator.observers],
 they will be notified as well (see [NavigatorObserver.didPush] and
 [NavigatorObserver.didRemove]). The removed routes are disposed of and
 notified, once the new route has finished animating. The futures that had
 been returned from pushing those routes will complete.

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the new route.
 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePushAndRemoveUntil], which pushes a route that can be
    restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `newRoute`: `Route&lt;T&gt;`
- `predicate`: `RoutePredicate`
