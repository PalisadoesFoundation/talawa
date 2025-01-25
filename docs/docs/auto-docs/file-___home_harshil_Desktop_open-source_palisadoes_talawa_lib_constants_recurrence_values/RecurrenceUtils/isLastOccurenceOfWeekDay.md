




isLastOccurenceOfWeekDay method - RecurrenceUtils class - recurrence\_values library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/recurrence\_values.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/)
3. [RecurrenceUtils](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/RecurrenceUtils-class.html)
4. isLastOccurenceOfWeekDay static method

isLastOccurenceOfWeekDay


dark\_mode

light\_mode




# isLastOccurenceOfWeekDay static method


[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
isLastOccurenceOfWeekDay(

1. [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) date

)

Function to check whether cuurent event instance is Last occurence of Week Day.

**params**:

* `date`: Date of the event.

**returns**:

* `bool`: Returns true if the current event instance is the last occurence of the week day.

## Implementation

```
static bool isLastOccurenceOfWeekDay(DateTime date) {
  final currentDay = date.weekday;

  DateTime lastOccurenceInMonth = DateTime(
    date.year,
    date.month + 1,
    0,
  );

  // set the lastOccurenceInMonth to that day's last occurence
  while (lastOccurenceInMonth.weekday != currentDay) {
    lastOccurenceInMonth = DateTime(
      lastOccurenceInMonth.year,
      lastOccurenceInMonth.month,
      lastOccurenceInMonth.day - 1,
    );
  }

  return date.day == lastOccurenceInMonth.day;
}
```

 


1. [talawa](../../index.html)
2. [recurrence\_values](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/)
3. [RecurrenceUtils](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_constants_recurrence_values/RecurrenceUtils-class.html)
4. isLastOccurenceOfWeekDay static method

##### RecurrenceUtils class





talawa
1.0.0+1






