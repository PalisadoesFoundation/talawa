# Method: `of`

## Description

Returns the [data] from the closest [TextSelectionTheme] ancestor. If
 there is no ancestor, it returns [ThemeData.textSelectionTheme].
 Applications can assume that the returned value will not be null.

 Typical usage is as follows:

 ```dart
 TextSelectionThemeData theme = TextSelectionTheme.of(context);
 ```

## Return Type
`TextSelectionThemeData`

## Parameters

- `context`: `BuildContext`
