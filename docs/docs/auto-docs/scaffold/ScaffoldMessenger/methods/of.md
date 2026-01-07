# Method: `of`

## Description

The state from the closest instance of this class that encloses the given
 context.

 
 Typical usage of the [ScaffoldMessenger.of] function is to call it in
 response to a user gesture or an application state change.

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger.of.0.dart **
 

 A less elegant but more expedient solution is to assign a [GlobalKey] to the
 [ScaffoldMessenger], then use the `key.currentState` property to obtain the
 [ScaffoldMessengerState] rather than using the [ScaffoldMessenger.of]
 function. The [MaterialApp.scaffoldMessengerKey] refers to the root
 ScaffoldMessenger that is provided by default.

 
 Sometimes [SnackBar]s are produced by code that doesn't have ready access
 to a valid [BuildContext]. One such example of this is when you show a
 SnackBar from a method outside of the `build` function. In these
 cases, you can assign a [GlobalKey] to the [ScaffoldMessenger]. This
 example shows a key being used to obtain the [ScaffoldMessengerState]
 provided by the [MaterialApp].

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger.of.1.dart **
 

 If there is no [ScaffoldMessenger] in scope, then this will assert in
 debug mode, and throw an exception in release mode.

 See also:

  * [maybeOf], which is a similar function but will return null instead of
    throwing if there is no [ScaffoldMessenger] ancestor.
  * [debugCheckHasScaffoldMessenger], which asserts that the given context
    has a [ScaffoldMessenger] ancestor.

## Return Type
`ScaffoldMessengerState`

## Parameters

- `context`: `BuildContext`
