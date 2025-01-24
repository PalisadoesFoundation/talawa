




dateTimeFields constant - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../utils_time_conversion/utils_time_conversion-library.html)
3. dateTimeFields constant

dateTimeFields


dark\_mode

light\_mode




# dateTimeFields top-level constant


Map<String, List<Object>>
const dateTimeFields

Contains information about the date and time fields used for conversion.


## Implementation

```
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

 


1. [talawa](../index.html)
2. [time\_conversion](../utils_time_conversion/utils_time_conversion-library.html)
3. dateTimeFields constant

##### time\_conversion library





talawa
1.0.0+1






