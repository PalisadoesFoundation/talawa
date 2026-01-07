# Method: `of`

## Description

The closest instance of this class that encloses the given context.

 If there is no enclosing [DropdownMenuTheme] widget, then
 [ThemeData.dropdownMenuTheme] is used.

 Typical usage is as follows:

 ```dart
 DropdownMenuThemeData theme = DropdownMenuTheme.of(context);
 ```

 See also:

  * [maybeOf], which returns null if it doesn't find a
    [DropdownMenuTheme] ancestor.

## Return Type
`DropdownMenuThemeData`

## Parameters

- `context`: `BuildContext`
