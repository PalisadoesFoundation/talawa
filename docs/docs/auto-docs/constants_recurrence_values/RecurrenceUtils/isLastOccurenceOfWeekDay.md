
<div>

# isLastOccurenceOfWeekDay static method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
isLastOccurenceOfWeekDay(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)]
    date]

)



Function to check whether cuurent event instance is Last occurence of
Week Day.

**params**:

-   `date`: Date of the event.

**returns**:

-   `bool`: Returns true if the current event instance is the last
    occurence of the week day.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.md)
4.  isLastOccurenceOfWeekDay static method

##### RecurrenceUtils class







