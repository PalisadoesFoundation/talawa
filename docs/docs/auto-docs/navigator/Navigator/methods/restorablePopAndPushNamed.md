# Method: `restorablePopAndPushNamed`

## Description

Pop the current route off the navigator that most tightly encloses the
 given context and push a named route in its place.

 
 Unlike [Route]s pushed via [popAndPushNamed], [Route]s pushed with
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
