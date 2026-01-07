# Method: `restorablePushAndRemoveUntil`

## Description

Push a new route onto the navigator that most tightly encloses the
 given context, and then remove all the previous routes until the
 `predicate` returns true.

 
 Unlike [Route]s pushed via [pushAndRemoveUntil], [Route]s pushed with this
 method are restored during state restoration according to the rules
 outlined in the "State Restoration" section of [Navigator].
 

 

 

 

 
 Typical usage is as follows:

 ** See code in examples/api/lib/widgets/navigator/navigator.restorable_push_and_remove_until.0.dart **
 

## Return Type
`String`

## Parameters

- `context`: `BuildContext`
- `newRouteBuilder`: `RestorableRouteBuilder&lt;T&gt;`
- `predicate`: `RoutePredicate`
- ``: `dynamic`
