# Method: `of`

## Description

The data from the closest instance of this class that encloses the given
 context.

 You can use this function to query the entire set of data held in the
 current [MediaQueryData] object. When any of that information changes,
 your widget will be scheduled to be rebuilt, keeping your widget
 up-to-date.

 Since it is typical that the widget only requires a subset of properties
 of the [MediaQueryData] object, prefer using the more specific methods
 (for example: [MediaQuery.sizeOf] and [MediaQuery.paddingOf]), as those
 methods will not cause a widget to rebuild when unrelated properties are
 updated.

 Typical usage is as follows:

 ```dart
 MediaQueryData media = MediaQuery.of(context);
 ```

 If there is no [MediaQuery] in scope, this method will throw a [TypeError]
 exception in release builds, and throw a descriptive [FlutterError] in
 debug builds.

 See also:

 * [maybeOf], which doesn't throw or assert if it doesn't find a
   [MediaQuery] ancestor. It returns null instead.
 * [sizeOf] and other specific methods for retrieving and depending on
   changes of a specific value.

## Return Type
`MediaQueryData`

## Parameters

- `context`: `BuildContext`
