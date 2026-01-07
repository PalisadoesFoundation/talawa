# Method: `pop`

## Description

Pop the top-most route off the navigator that most tightly encloses the
 given context.

 
 The current route's [Route.didPop] method is called first. If that method
 returns false, then the route remains in the [Navigator]'s history (the
 route is expected to have popped some internal state; see e.g.
 [LocalHistoryRoute]). Otherwise, the rest of this description applies.

 If non-null, `result` will be used as the result of the route that is
 popped; the future that had been returned from pushing the popped route
 will complete with `result`. Routes such as dialogs or popup menus
 typically use this mechanism to return the value selected by the user to
 the widget that created their route. The type of `result`, if provided,
 must match the type argument of the class of the popped route (`T`).

 The popped route and the route below it are notified (see [Route.didPop],
 [Route.didComplete], and [Route.didPopNext]). If the [Navigator] has any
 [Navigator.observers], they will be notified as well (see
 [NavigatorObserver.didPop]).

 The `T` type argument is the type of the return value of the popped route.

 The type of `result`, if provided, must match the type argument of the
 class of the popped route (`T`).
 

 

 Typical usage for closing a route is as follows:

 ```dart
 void  
 ```
 

 A dialog box might be closed with a result:

 ```dart
 void  
 ```

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
