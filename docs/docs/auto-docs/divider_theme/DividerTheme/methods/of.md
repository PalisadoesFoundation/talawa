# Method: `of`

## Description

The closest instance of this class's [data] value that encloses the given
 context.

 If there is no ancestor, it returns [ThemeData.dividerTheme]. Applications
 can assume that the returned value will not be null.

 Typical usage is as follows:

 ```dart
 DividerThemeData theme = DividerTheme.of(context);
 ```

## Return Type
`DividerThemeData`

## Parameters

- `context`: `BuildContext`
