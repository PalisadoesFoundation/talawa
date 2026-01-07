# Method: `firstDayOfWeekIndex`

## Description

Index of the first day of week, where 0 points to Sunday, and 6 points to
 Saturday.

 This getter is compatible with [narrowWeekdays]. For example:

 ```dart
  MaterialLocalizations localizations = MaterialLocalizations.of(context);
 // The name of the first day of week for the current locale.
 String firstDayOfWeek = localizations.narrowWeekdays[localizations.firstDayOfWeekIndex];
 ```

## Return Type
`int`

