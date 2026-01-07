# Method: `maybeOf`

## Description

The data from the closest instance of this class that encloses the given
 context, if any.

 Use this function if you want to allow situations where no [MediaQuery] is
 in scope. Prefer using [MediaQuery.of] in situations where a media query
 is always expected to exist.

 If there is no [MediaQuery] in scope, then this function will return null.

 You can use this function to query the entire set of data held in the
 current [MediaQueryData] object. When any of that information changes,
 your widget will be scheduled to be rebuilt, keeping your widget
 up-to-date.

 Since it is typical that the widget only requires a subset of properties
 of the [MediaQueryData] object, prefer using the more specific methods
 (for example: [MediaQuery.maybeSizeOf] and [MediaQuery.maybePaddingOf]),
 as those methods will not cause a widget to rebuild when unrelated
 properties are updated.

 Typical usage is as follows:

 ```dart
 MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
 if (mediaQuery == null) 
 ```

 See also:

 * [of], which will throw if it doesn't find a [MediaQuery] ancestor,
   instead of returning null.
 * [maybeSizeOf] and other specific methods for retrieving and depending on
   changes of a specific value.

## Return Type
`MediaQueryData?`

## Parameters

- `context`: `BuildContext`
