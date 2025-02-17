
<div>

# getWeekDayOccurenceInMonth static method

</div>


[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
getWeekDayOccurenceInMonth(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
    date]

)



\'getWeekDayOccurenceInMonth\' returns the week day occurence in month.

**params**:

-   `date`: Date of the event.

**returns**:

-   `int`: Week day occurence in month.



## Implementation

``` language-dart
static int getWeekDayOccurenceInMonth(DateTime date) {
  final dayOfMonth = date.day;

  // Calculate the current occurrence
  final occurrence = (dayOfMonth / 7).;

  return occurrence;
}
```







1.  [talawa](../../index.html)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getWeekDayOccurenceInMonth static method

##### RecurrenceUtils class







