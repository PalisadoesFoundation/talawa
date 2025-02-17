
<div>

# dateTimeFields top-level constant

</div>


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]\>]]\>]
const dateTimeFields



Contains information about the date and time fields used for conversion.



## Implementation

``` language-dart
const dateTimeFields = {
  'directFields': [
    'createdAt',
    'birthDate',
    'updatedAt',
    'recurrenceStartDate',
    'recurrenceEndDate',
    'pluginCreatedBy',
    'dueDate',
    'completionDate',
    'startCursor',
    'endCursor',
  ],
  'pairedFields': [
    {'dateField': 'startDate', 'timeField': 'startTime'},
    {'dateField': 'endDate', 'timeField': 'endTime'},
  ],
};
```







1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  dateTimeFields constant

##### time_conversion library







