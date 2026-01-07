# Method: `maybeOf`

## Description

The data from the closest instance of this class that encloses the given
 context, if any.

 Use this function if you want to allow situations where no
 [SegmentedButtonTheme] is in scope. Prefer using [SegmentedButtonTheme.of]
 in situations where a [SegmentedButtonThemeData] is expected to be
 non-null.

 If there is no [SegmentedButtonTheme] in scope, then this function will
 return null.

 Typical usage is as follows:

 ```dart
 SegmentedButtonThemeData? theme = SegmentedButtonTheme.maybeOf(context);
 if (theme == null) 
 ```

 See also:

  * [of], which will return [ThemeData.segmentedButtonTheme] if it doesn't
    find a [SegmentedButtonTheme] ancestor, instead of returning null.

## Return Type
`SegmentedButtonThemeData?`

## Parameters

- `context`: `BuildContext`
