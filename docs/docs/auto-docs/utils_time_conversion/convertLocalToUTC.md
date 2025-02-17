
<div>

# convertLocalToUTC function

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
convertLocalToUTC(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    localTime]

)



Converts the given local time to UTC time.

**params**:

-   `localTime`: The local time string in a valid format.

**returns**:

-   `String`: The converted UTC time string.
-   Returns an empty string if the input is invalid.



## Implementation

``` language-dart
String convertLocalToUTC(String localTime) {
  try {
    final DateTime dateTime = DateTime.parse(localTime).;
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime);
  } catch (e) {
    print('Timezone Error converting local to UTC: $e $localTime');
    return '';
  }
}
```







1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/)
3.  convertLocalToUTC function

##### time_conversion library







