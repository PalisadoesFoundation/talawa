# Method: `of`

## Description

The state from the closest instance of this class that encloses the given
 context.

 Typical usage is as follows:

 ```dart
 Navigator.of(context)
   ..
   ..
   ..pushNamed('/settings');
 ```

 If `rootNavigator` is set to true, the state from the furthest instance of
 this class is given instead. Useful for pushing contents above all
 subsequent instances of [Navigator].

 If there is no [Navigator] in the given `context`, this function will throw
 a [FlutterError] in debug mode, and an exception in release mode.

 This method can be expensive (it walks the element tree).

## Return Type
`NavigatorState`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
