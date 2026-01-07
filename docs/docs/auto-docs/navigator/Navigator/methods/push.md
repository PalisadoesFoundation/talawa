# Method: `push`

## Description

Push the given route onto the navigator that most tightly encloses the
 given context.

 
 The new route and the previous route (if any) are notified (see
 [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
 [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didPush]).

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the route.
 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePush], which pushes a route that can be restored during
    state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `route`: `Route&lt;T&gt;`
