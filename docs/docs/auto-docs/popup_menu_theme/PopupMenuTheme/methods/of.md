# Method: `of`

## Description

The closest instance of this class's [data] value that encloses the given
 context. If there is no ancestor, it returns [ThemeData.popupMenuTheme].
 Applications can assume that the returned value will not be null.

 Typical usage is as follows:

 ```dart
 PopupMenuThemeData theme = PopupMenuTheme.of(context);
 ```

## Return Type
`PopupMenuThemeData`

## Parameters

- `context`: `BuildContext`
