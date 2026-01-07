# Method: `pushReplacement`

## Description

Replace the current route of the navigator that most tightly encloses the
 given context by pushing the given route and then disposing the previous
 route once the new route has finished animating in.

 
 If non-null, `result` will be used as the result of the route that is
 removed; the future that had been returned from pushing that old route will
 complete with `result`. Routes such as dialogs or popup menus typically
 use this mechanism to return the value selected by the user to the widget
 that created their route. The type of `result`, if provided, must match
 the type argument of the class of the old route (`TO`).

 The new route and the route below the removed route are notified (see
 [Route.didPush] and [Route.didChangeNext]). If the [Navigator] has any
 [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didReplace]). The removed route is notified once the
 new route has finished animating (see [Route.didComplete]).

 Ongoing gestures within the current route are canceled when a new route is
 pushed.

 The `T` type argument is the type of the return value of the new route,
 and `TO` is the type of the return value of the old route.
 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePushReplacement], which pushes a replacement route that can
    be restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `context`: `BuildContext`
- `newRoute`: `Route&lt;T&gt;`
- ``: `dynamic`
