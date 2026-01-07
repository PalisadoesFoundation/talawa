# Method: `popUntil`

## Description

Calls [pop] repeatedly on the navigator that most tightly encloses the
 given context until the predicate returns true.

 
 The predicate may be applied to the same route more than once if
 [Route.willHandlePopInternally] is true.

 To pop until a route with a certain name, use the [RoutePredicate]
 returned from [ModalRoute.withName].

 The routes are closed with null as their `return` value.

 See [pop] for more details of the semantics of popping a route.
 

 

 Typical usage is as follows:

 ```dart
 void  
 ```
 

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `predicate`: `RoutePredicate`
