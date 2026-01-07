# Method: `pushNamed`

## Description

Push a named route onto the navigator that most tightly encloses the given
 context.

 
 The route name will be passed to the [Navigator.onGenerateRoute]
 callback. The returned route will be pushed into the navigator.

 The new route and the previous route (if any) are notified (see
 [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
 [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didPush]).

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the route.

 To use [pushNamed], an [Navigator.onGenerateRoute] callback must be
 provided,
 

 
 Returns a [Future] that completes to the `result` value passed to [pop]
 when the pushed route is popped off the navigator.
 

 
 The provided `arguments` are passed to the pushed route via
 [RouteSettings.arguments]. Any object can be passed as `arguments` (e.g. a
 [String], [int], or an instance of a custom `MyRouteArguments` class).
 Often, a [Map] is used to pass key-value pairs.

 The `arguments` may be used in [Navigator.onGenerateRoute] or
 [Navigator.onUnknownRoute] to construct the route.
 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 

 The following example shows how to pass additional `arguments` to the
 route:

 ```dart
 void  
 ```
 

 

 The following example shows how to pass a custom Object to the route:

 ```dart
 class WeatherRouteArguments 

 void  
 ```
 

 See also:

  * [restorablePushNamed], which pushes a route that can be restored
    during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `routeName`: `String`
- ``: `dynamic`
