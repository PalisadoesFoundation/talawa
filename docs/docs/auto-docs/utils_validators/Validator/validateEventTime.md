



menu

1.  [talawa](../../index.md)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateEventTime static method


validateEventTime


 dark_mode   light_mode 




<div>

# validateEventTime static method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
validateEventTime(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)]
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
static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) 
```







1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateEventTime static method

##### Validator class









 talawa 1.0.0+1 
