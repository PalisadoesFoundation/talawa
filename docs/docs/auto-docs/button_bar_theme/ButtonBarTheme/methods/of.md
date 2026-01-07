# Method: `of`

## Description

Returns the configuration [data] from the closest [ButtonBarTheme]
 ancestor. If there is no ancestor, it returns [ThemeData.buttonBarTheme].
 Applications can assume that the returned value will not be null.

 Typical usage is as follows:

 ```dart
 ButtonBarThemeData theme = ButtonBarTheme.of(context);
 ```

## Return Type
`ButtonBarThemeData`

## Parameters

- `context`: `BuildContext`
