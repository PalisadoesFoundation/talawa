




combineDateTime function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../utils_time_conversion/utils_time_conversion-library.html)
3. combineDateTime function

combineDateTime


dark\_mode

light\_mode




# combineDateTime function


String
combineDateTime(

1. String date,
2. String time

)

Combines the given date and time strings into a single string.

**params**:

* `date`: The date string in a valid date format (e.g., 'YYYY-MM-DD').
* `time`: The time string in a valid time format (e.g., 'HH:MM:SS').

**returns**:

* `String`: A string that combines the `date` and `time`, separated by a space.

## Implementation

```
String combineDateTime(String date, String time) {
  return '$date $time';
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../utils_time_conversion/utils_time_conversion-library.html)
3. combineDateTime function

##### time\_conversion library





talawa
1.0.0+1






