# Method: `maybeOf`

## Description

The state from the closest instance of this class that encloses the given
 context, if any.

 Typical usage is as follows:

 ```dart
 NavigatorState? navigatorState = Navigator.maybeOf(context);
 if (navigatorState != null) 
 ```

 If `rootNavigator` is set to true, the state from the furthest instance of
 this class is given instead. Useful for pushing contents above all
 subsequent instances of [Navigator].

 Will return null if there is no ancestor [Navigator] in the `context`.

 This method can be expensive (it walks the element tree).

## Return Type
`NavigatorState?`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
