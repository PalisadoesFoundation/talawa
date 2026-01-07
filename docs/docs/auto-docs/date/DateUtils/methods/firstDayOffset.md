# Method: `firstDayOffset`

## Description


 Computes the offset from the first day of the week that the first day of
 the [month] falls on.

 For example, September 1, 2017 falls on a Friday, which in the calendar
 localized for United States English appears as:

     S M T W T F S
     _ _ _ _ _ 1 2

 The offset for the first day of the months is the number of leading blanks
 in the calendar, i.e. 5.

 The same date localized for the Russian calendar has a different offset,
 because the first day of week is Monday rather than Sunday:

     M T W T F S S
     _ _ _ _ 1 2 3

 So the offset is 4, rather than 5.

 This code consolidates the following:

 - [DateTime.weekday] provides a 1-based index into days of week, with 1
   falling on Monday.
 - [MaterialLocalizations.firstDayOfWeekIndex] provides a 0-based index
   into the [MaterialLocalizations.narrowWeekdays] list.
 - [MaterialLocalizations.narrowWeekdays] list provides localized names of
   days of week, always starting with Sunday and ending with Saturday.
 

## Return Type
`int`

## Parameters

- `year`: `int`
- `month`: `int`
- `localizations`: `MaterialLocalizations`
