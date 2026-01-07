# Method: `restorablePush`

## Description

Push a new route onto the navigator that most tightly encloses the
 given context.

 
 Unlike [Route]s pushed via [push], [Route]s pushed with this method are
 restored during state restoration according to the rules outlined in the
 "State Restoration" section of [Navigator].
 

 

 
 The method takes a [RestorableRouteBuilder] as argument, which must be a
 _static_ function annotated with `@pragma('vm:entry-point')`. It must
 instantiate and return a new [Route] object that will be added to the
 navigator. The provided `arguments` object is passed to the
 `routeBuilder`. The navigator calls the static `routeBuilder` function
 again during state restoration to re-create the route object.

 Any object that is serializable via the [StandardMessageCodec] can be
 passed as `arguments`. Often, a Map is used to pass key-value pairs.
 

 

 
 Typical usage is as follows:

 ** See code in examples/api/lib/widgets/navigator/navigator.restorable_push.0.dart **
 

## Return Type
`String`

## Parameters

- `context`: `BuildContext`
- `routeBuilder`: `RestorableRouteBuilder&lt;T&gt;`
- ``: `dynamic`
