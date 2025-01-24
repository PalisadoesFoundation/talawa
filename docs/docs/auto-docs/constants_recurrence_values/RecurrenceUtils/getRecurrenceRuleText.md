




getRecurrenceRuleText method - RecurrenceUtils class - recurrence\_values library - Dart API







menu

1. [talawa](../../index.html)
2. [constants/recurrence\_values.dart](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getRecurrenceRuleText static method

getRecurrenceRuleText


dark\_mode

light\_mode




# getRecurrenceRuleText static method


String
getRecurrenceRuleText(

1. String frequency,
2. Set<String>? weekDays,
3. int? interval,
4. int? count,
5. int? weekDayOccurenceInMonth,
6. DateTime startDate,
7. DateTime? endDate,

)

'getRecurrenceRuleText' return text for various recurrence rules.

**params**:

* `frequency`: Frequency of the event.
* `weekDays`: List of week days.
* `interval`: Interval of the event.
* `count`: Count of the event.
* `weekDayOccurenceInMonth`: Week day occurence in month.
* `startDate`: Start date of the event.
* `endDate`: End date of the event.

**returns**:

* `String`: Recurrence rule text.

## Implementation

```
static String getRecurrenceRuleText(
  String frequency,
  Set<String>? weekDays,
  int? interval,
  int? count,
  int? weekDayOccurenceInMonth,
  DateTime startDate,
  DateTime? endDate,
) {
  String recurrenceRuleText = '';

  switch (frequency) {
    case Frequency.daily:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval days';
      } else {
        recurrenceRuleText = 'Daily';
      }
      break;
    case Frequency.weekly:
      if (weekDays == null) {
        break;
      }
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval weeks on ';
      } else {
        recurrenceRuleText = 'Weekly on ';
      }
      recurrenceRuleText += getWeekDaysString(weekDays.toList());
      break;
    case Frequency.monthly:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval months on ';
      } else {
        recurrenceRuleText = 'Monthly on ';
      }

      if (weekDayOccurenceInMonth != null) {
        final getOccurence =
            weekDayOccurenceInMonth != -1 ? weekDayOccurenceInMonth - 1 : 4;
        recurrenceRuleText +=
            '${weekDayOccurences[getOccurence]} ${RecurrenceUtils.weekDays[startDate.weekday - 1]}';
      } else {
        recurrenceRuleText += 'Day ${startDate.day}';
      }
      break;
    case Frequency.yearly:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval years on ';
      } else {
        recurrenceRuleText = 'Annually on ';
      }
      recurrenceRuleText +=
          '${monthNames[startDate.month - 1]} ${startDate.day}';
      break;
  }

  if (endDate != null) {
    final formatter = DateFormat('MMMM dd, yyyy');
    recurrenceRuleText += ', until ${formatter.format(endDate)}';
  }

  if (count != null) {
    recurrenceRuleText += ', $count ${count > 1 ? 'times' : 'time'}';
  }

  return recurrenceRuleText;
}
```

 


1. [talawa](../../index.html)
2. [recurrence\_values](../../constants_recurrence_values/constants_recurrence_values-library.html)
3. [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4. getRecurrenceRuleText static method

##### RecurrenceUtils class





talawa
1.0.0+1






