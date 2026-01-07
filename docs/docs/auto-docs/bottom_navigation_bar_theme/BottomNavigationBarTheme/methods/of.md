# Method: `of`

## Description

Returns the configuration [data] from the closest
 [BottomNavigationBarTheme] ancestor. If there is no ancestor, it returns
 [ThemeData.bottomNavigationBarTheme]. Applications can assume that the
 returned value will not be null.

 Typical usage is as follows:

 ```dart
 BottomNavigationBarThemeData theme = BottomNavigationBarTheme.of(context);
 ```

## Return Type
`BottomNavigationBarThemeData`

## Parameters

- `context`: `BuildContext`
