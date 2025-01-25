




getWeekDayOccurenceInMonth method - RecurrenceUtils class - recurrence\_values library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/recurrence\_values.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/)
3. [RecurrenceUtils](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDayOccurenceInMonth static method

getWeekDayOccurenceInMonth


dark\_mode

light\_mode




# getWeekDayOccurenceInMonth static method


[int](https://api.flutter.dev/flutter/dart-core/int-class.html)
getWeekDayOccurenceInMonth(

1. [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) date

)

'getWeekDayOccurenceInMonth' returns the week day occurence in month.

**params**:

* `date`: Date of the event.

**returns**:

* `int`: Week day occurence in month.

## Implementation

```
static int getWeekDayOccurenceInMonth(DateTime date) {
  final dayOfMonth = date.day;

  // Calculate the current occurrence
  final occurrence = (dayOfMonth / 7).ceil();

  return occurrence;
}
```

 


1. [talawa](../../index.html)
2. [recurrence\_values](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/)
3. [RecurrenceUtils](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDayOccurenceInMonth static method

##### RecurrenceUtils class





talawa
1.0.0+1






