# Method: `restorablePushNamedAndRemoveUntil`

## Description

Push the route with the given name onto the navigator that most tightly
 encloses the given context, and then remove all the previous routes until
 the `predicate` returns true.

 
 Unlike [Route]s pushed via [pushNamedAndRemoveUntil], [Route]s pushed with
 this method are restored during state restoration according to the rules
 outlined in the "State Restoration" section of [Navigator].
 

 

 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

## Return Type
`String`

## Parameters

- `context`: `BuildContext`
- `newRouteName`: `String`
- `predicate`: `RoutePredicate`
- ``: `dynamic`
