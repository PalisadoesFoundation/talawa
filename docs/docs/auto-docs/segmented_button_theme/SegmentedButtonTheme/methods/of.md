# Method: `of`

## Description

The [data] from the closest instance of this class that encloses the given
 context.

 If there is no [SegmentedButtonTheme] in scope, this will return
 [ThemeData.segmentedButtonTheme] from the ambient [Theme].

 Typical usage is as follows:

 ```dart
 SegmentedButtonThemeData theme = SegmentedButtonTheme.of(context);
 ```

 See also:

  * [maybeOf], which returns null if it doesn't find a
    [SegmentedButtonTheme] ancestor.

## Return Type
`SegmentedButtonThemeData`

## Parameters

- `context`: `BuildContext`
