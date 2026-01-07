# Method: `of`

## Description

The [data] value of the closest [TimePickerTheme] ancestor.

 If there is no ancestor, it returns [ThemeData.timePickerTheme].
 Applications can assume that the returned value will not be null.

 Typical usage is as follows:

 ```dart
 TimePickerThemeData theme = TimePickerTheme.of(context);
 ```

## Return Type
`TimePickerThemeData`

## Parameters

- `context`: `BuildContext`
