# Method: `of`

## Description

Returns the configuration [data] from the closest
 [DataTableTheme] ancestor. If there is no ancestor, it returns
 [ThemeData.dataTableTheme]. Applications can assume that the
 returned value will not be null.

 Typical usage is as follows:

 ```dart
 DataTableThemeData theme = DataTableTheme.of(context);
 ```

## Return Type
`DataTableThemeData`

## Parameters

- `context`: `BuildContext`
