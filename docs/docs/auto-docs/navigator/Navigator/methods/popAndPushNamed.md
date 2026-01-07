# Method: `popAndPushNamed`

## Description

Pop the current route off the navigator that most tightly encloses the
 given context and push a named route in its place.

 
 The popping of the previous route is handled as per [pop].

 The new route's name will be passed to the [Navigator.onGenerateRoute]
 callback. The returned route will be pushed into the navigator.

 The new route, the old route, and the route below the old route (if any)
 are all notified (see [Route.didPop], [Route.didComplete],
 [Route.didPopNext], [Route.didPush], and [Route.didChangeNext]). If the
 [Navigator] has any [Navigator.observers], they will be notified as well
 (see [NavigatorObserver.didPop] and [NavigatorObserver.didPush]). The
 animations for the pop and the push are performed simultaneously, so the
 route below may be briefly visible even if both the old route and the new
 route are opaque (see [TransitionRoute.opaque]).

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the new route,
 and `TO` is the return value type of the old route.

 To use [popAndPushNamed], a [Navigator.onGenerateRoute] callback must be provided.
 

 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePopAndPushNamed], which pushes a new route that can be
    restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `routeName`: `String`
- ``: `dynamic`
- ``: `dynamic`
