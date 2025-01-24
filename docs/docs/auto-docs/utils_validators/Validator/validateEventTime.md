




validateEventTime method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateEventTime static method

validateEventTime


dark\_mode

light\_mode




# validateEventTime static method


String?
validateEventTime(

1. [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) startTime,
2. [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html) endTime

)

Method to validate event time.

**params**:

* `startTime`: the start time of the event
* `endTime`: the end time of the event

**returns**:

* `String?`: error message if time is invalid.

## Implementation

```
static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) {
  if (startTime.hour > endTime.hour ||
      (startTime.hour == endTime.hour && startTime.minute > endTime.minute)) {
    return 'Start time must be before or equal to end time';
  }
  return null;
}
```

 


1. [talawa](../../index.html)
2. [validators](../../utils_validators/utils_validators-library.html)
3. [Validator](../../utils_validators/Validator-class.html)
4. validateEventTime static method

##### Validator class





talawa
1.0.0+1






