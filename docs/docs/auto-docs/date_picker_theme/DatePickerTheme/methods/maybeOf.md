# Method: `maybeOf`

## Description

The data from the closest instance of this class that encloses the given
 context, if any.

 Use this function if you want to allow situations where no
 [DatePickerTheme] is in scope. Prefer using [DatePickerTheme.of]
 in situations where a [DatePickerThemeData] is expected to be
 non-null.

 If there is no [DatePickerTheme] in scope, then this function will
 return null.

 Typical usage is as follows:

 ```dart
 DatePickerThemeData? theme = DatePickerTheme.maybeOf(context);
 if (theme == null) 
 ```

 See also:

  * [of], which will return [ThemeData.datePickerTheme] if it doesn't
    find a [DatePickerTheme] ancestor, instead of returning null.
  * [defaults], which will return the default properties used when no
    other [DatePickerTheme] has been provided.

## Return Type
`DatePickerThemeData?`

## Parameters

- `context`: `BuildContext`
