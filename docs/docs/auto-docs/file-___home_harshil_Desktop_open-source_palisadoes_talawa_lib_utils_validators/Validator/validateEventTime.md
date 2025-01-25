




validateEventTime method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateEventTime static method

validateEventTime


dark\_mode

light\_mode




# validateEventTime static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
validateEventTime(

1. dynamic startTime,
2. dynamic endTime

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
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validateEventTime static method

##### Validator class





talawa
1.0.0+1






