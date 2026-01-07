# Method: `pushNamedAndRemoveUntil`

## Description

Push the route with the given name onto the navigator that most tightly
 encloses the given context, and then remove all the previous routes until
 the `predicate` returns true.

 
 The predicate may be applied to the same route more than once if
 [Route.willHandlePopInternally] is true.

 To remove routes until a route with a certain name, use the
 [RoutePredicate] returned from [ModalRoute.withName].

 To remove all the routes below the pushed route, use a [RoutePredicate]
 that always returns false (e.g. `(Route&lt;dynamic&gt; route) => false`).

 The removed routes are removed without being completed, so this method
 does not take a return value argument.

 The new route's name (`routeName`) will be passed to the
 [Navigator.onGenerateRoute] callback. The returned route will be pushed
 into the navigator.

 The new route and the route below the bottommost removed route (which
 becomes the route below the new route) are notified (see [Route.didPush]
 and [Route.didChangeNext]). If the [Navigator] has any
 [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didPush] and [NavigatorObserver.didRemove]). The
 removed routes are disposed, once the new route has finished animating,
 and the futures that had been returned from pushing those routes
 will complete.

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the new route.

 To use [pushNamedAndRemoveUntil], an [Navigator.onGenerateRoute] callback
 must be provided.
 

 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePushNamedAndRemoveUntil], which pushes a new route that can
    be restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `newRouteName`: `String`
- `predicate`: `RoutePredicate`
- ``: `dynamic`
