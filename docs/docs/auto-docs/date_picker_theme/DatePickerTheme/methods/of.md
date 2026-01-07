# Method: `of`

## Description

The [data] from the closest instance of this class that encloses the given
 context.

 If there is no [DatePickerTheme] in scope, this will return
 [ThemeData.datePickerTheme] from the ambient [Theme].

 Typical usage is as follows:

 ```dart
 DatePickerThemeData theme = DatePickerTheme.of(context);
 ```

 See also:

  * [maybeOf], which returns null if it doesn't find a
    [DatePickerTheme] ancestor.
  * [defaults], which will return the default properties used when no
    other [DatePickerTheme] has been provided.

## Return Type
`DatePickerThemeData`

## Parameters

- `context`: `BuildContext`
