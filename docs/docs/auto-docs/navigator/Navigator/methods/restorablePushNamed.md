# Method: `restorablePushNamed`

## Description

Push a named route onto the navigator that most tightly encloses the given
 context.

 
 Unlike [Route]s pushed via [pushNamed], [Route]s pushed with this method
 are restored during state restoration according to the rules outlined
 in the "State Restoration" section of [Navigator].
 

 

 
 The provided `arguments` are passed to the pushed route via
 [RouteSettings.arguments]. Any object that is serializable via the
 [StandardMessageCodec] can be passed as `arguments`. Often, a Map is used
 to pass key-value pairs.

 The arguments may be used in [Navigator.onGenerateRoute] or
 [Navigator.onUnknownRoute] to construct the route.
 

 
 The method returns an opaque ID for the pushed route that can be used by
 the [RestorableRouteFuture] to gain access to the actual [Route] object
 added to the navigator and its return value. You can ignore the return
 value of this method, if you do not care about the route object or the
 route's return value.
 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

## Return Type
`String`

## Parameters

- `context`: `BuildContext`
- `routeName`: `String`
- ``: `dynamic`
