



menu

1.  [talawa](../index.md)
2.  [utils/time_conversion.dart](../utils_time_conversion/)
3.  combineDateTime function


combineDateTime


 dark_mode   light_mode 




<div>

# combineDateTime function

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
combineDateTime(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?]
    date, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    time]

)



Combines the given date and time strings into a single string.

**params**:

-   `date`: The date string in a valid date format (e.g.,
    \'YYYY-MM-DD\').
-   `time`: The time string in a valid time format (e.g., \'HH:MM:SS\').

**returns**:

-   `String`: A string that combines the `date` and `time`, separated by
    a space.
-   Returns an empty string if either input is null or empty.



## Implementation

``` language-dart
String combineDateTime(String? date, String? time) 
```







1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/)
3.  combineDateTime function

##### time_conversion library









 talawa 1.0.0+1 
