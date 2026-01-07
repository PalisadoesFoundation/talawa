# Method: `pushNamedAndRemoveUntil`

## Description

Push the route with the given name onto the navigator, and then remove all
 the previous routes until the `predicate` returns true.

 

 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

 See also:

  * [restorablePushNamedAndRemoveUntil], which pushes a new route that can
    be restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `newRouteName`: `String`
- `predicate`: `RoutePredicate`
- ``: `dynamic`
