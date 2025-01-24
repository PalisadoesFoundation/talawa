




getWeekDaysString method - RecurrenceUtils class - recurrence\_values library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/recurrence\_values.dart](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDaysString static method

getWeekDaysString


dark\_mode

light\_mode




# getWeekDaysString static method


String
getWeekDaysString(

1. List<String> weekDays

)

'getWeekDaysString' returns string for weekDays.

**params**:

* `weekDays`: List of Weekdays

**returns**:

* `String`: returns string for weekDays.

## Implementation

```
static String getWeekDaysString(List<String> weekDays) {
  final fullDayNames = weekDays
      .map((day) => RecurrenceUtils.weekDays[weekDays.indexOf(day)])
      .toList();

  String weekDaysString = fullDayNames.join(', ');

  final lastCommaIndex = weekDaysString.lastIndexOf(',');
  if (lastCommaIndex != -1) {
    weekDaysString =
        '${weekDaysString.substring(0, lastCommaIndex)} &${weekDaysString.substring(lastCommaIndex + 1)}';
  }

  return weekDaysString;
}
```

 


1. [talawa](../../index.html)
2. [recurrence\_values](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDaysString static method

##### RecurrenceUtils class





talawa
1.0.0+1






