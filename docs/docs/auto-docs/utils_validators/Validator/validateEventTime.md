
<div>

# validateEventTime static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateEventTime(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
    startTime, ]
2.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]
    endTime]

)



Method to validate event time.

**params**:

-   `startTime`: the start time of the event
-   `endTime`: the end time of the event

**returns**:

-   `String?`: error message if time is invalid.



## Implementation

``` language-dart
static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) {
  if (startTime.hour > endTime.hour ||
      (startTime.hour == endTime.hour && startTime.minute > endTime.minute)) {
    return 'Start time must be before or equal to end time';
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateEventTime static method

##### Validator class







