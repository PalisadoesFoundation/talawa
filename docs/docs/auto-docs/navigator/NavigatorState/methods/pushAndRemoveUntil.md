# Method: `pushAndRemoveUntil`

## Description

Push the given route onto the navigator, and then remove all the previous
 routes until the `predicate` returns true.

 

 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 


 See also:

  * [restorablePushAndRemoveUntil], which pushes a route that can be
    restored during state restoration.

## Return Type
`Future<T?>`

## Parameters

- `newRoute`: `Route&lt;T&gt;`
- `predicate`: `RoutePredicate`
