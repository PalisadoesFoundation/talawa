# Method: `restorablePushReplacementNamed`

## Description

Replace the current route of the navigator that most tightly encloses the
 given context by pushing the route named [routeName] and then disposing
 the previous route once the new route has finished animating in.

 
 Unlike [Route]s pushed via [pushReplacementNamed], [Route]s pushed with
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
- `routeName`: `String`
- ``: `dynamic`
- ``: `dynamic`
