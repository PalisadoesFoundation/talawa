
<div>

# getRecurrenceRuleText static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
getRecurrenceRuleText(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    frequency,
    ]
2.  [[[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]?]
    weekDays, ]
3.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
    interval, ]
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
    count, ]
5.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]
    weekDayOccurenceInMonth,
    ]
6.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]
    startDate,
    ]
7.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]
    endDate, ]

)



\'getRecurrenceRuleText\' return text for various recurrence rules.

**params**:

-   `frequency`: Frequency of the event.
-   `weekDays`: List of week days.
-   `interval`: Interval of the event.
-   `count`: Count of the event.
-   `weekDayOccurenceInMonth`: Week day occurence in month.
-   `startDate`: Start date of the event.
-   `endDate`: End date of the event.

**returns**:

-   `String`: Recurrence rule text.



## Implementation

``` language-dart
static String getRecurrenceRuleText(
  String frequency,
  Set&lt;String&gt;? weekDays,
  int? interval,
  int? count,
  int? weekDayOccurenceInMonth,
  DateTime startDate,
  DateTime? endDate,
) 
```







1.  [talawa](../../index.md)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.md)
4.  getRecurrenceRuleText static method

##### RecurrenceUtils class







