
<div>

# getWeekDaysString static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getWeekDaysString(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
    weekDays]

)



\'getWeekDaysString\' returns string for weekDays.

**params**:

-   `weekDays`: List of Weekdays

**returns**:

-   `String`: returns string for weekDays.



## Implementation

``` language-dart
static String getWeekDaysString(List<String> weekDays) {
  final fullDayNames = weekDays
      .map((day) => RecurrenceUtils.weekDays[weekDays.indexOf(day)])
      .;

  String weekDaysString = fullDayNames.join(', ');

  final lastCommaIndex = weekDaysString.lastIndexOf(',');
  if (lastCommaIndex != -1) {
    weekDaysString =
        '${weekDaysString.substring(0, lastCommaIndex)} &${weekDaysString.substring(lastCommaIndex + 1)}';
  }

  return weekDaysString;
}
```







1.  [talawa](../../index.html)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getWeekDaysString static method

##### RecurrenceUtils class







