# Method: `restorablePushReplacement`

## Description

Replace the current route of the navigator that most tightly encloses the
 given context by pushing a new route and then disposing the previous
 route once the new route has finished animating in.

 
 Unlike [Route]s pushed via [pushReplacement], [Route]s pushed with this
 method are restored during state restoration according to the rules
 outlined in the "State Restoration" section of [Navigator].
 

 

 

 

 
 Typical usage is as follows:

 ** See code in examples/api/lib/widgets/navigator/navigator.restorable_push_replacement.0.dart **
 

## Return Type
`String`

## Parameters

- `context`: `BuildContext`
- `routeBuilder`: `RestorableRouteBuilder&lt;T&gt;`
- ``: `dynamic`
- ``: `dynamic`
