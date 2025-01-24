




getWeekDayOccurenceInMonth method - RecurrenceUtils class - recurrence\_values library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/recurrence\_values.dart](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDayOccurenceInMonth static method

getWeekDayOccurenceInMonth


dark\_mode

light\_mode




# getWeekDayOccurenceInMonth static method


int
getWeekDayOccurenceInMonth(

1. DateTime date

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
2. [recurrence\_values](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getWeekDayOccurenceInMonth static method

##### RecurrenceUtils class





talawa
1.0.0+1






