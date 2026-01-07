# Method: `maybeOf`

## Description

The data from the closest instance of this class that encloses the given
 context, if any.

 Use this function if you want to allow situations where no
 [DropdownMenuTheme] is in scope. Prefer using [DropdownMenuTheme.of]
 in situations where a [DropdownMenuThemeData] is expected to be
 non-null.

 If there is no [DropdownMenuTheme] in scope, then this function will
 return null.

 Typical usage is as follows:

 ```dart
 DropdownMenuThemeData? theme = DropdownMenuTheme.maybeOf(context);
 if (theme == null) 
 ```

 See also:

  * [of], which will return [ThemeData.dropdownMenuTheme] if it doesn't
    find a [DropdownMenuTheme] ancestor, instead of returning null.

## Return Type
`DropdownMenuThemeData?`

## Parameters

- `context`: `BuildContext`
