
<div>

# convertUTCToLocal function

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
convertUTCToLocal(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    utcTime]

)



Converts the given UTC time to local time.

**params**:

-   `utcTime`: The UTC time string in a valid format.

**returns**:

-   `String`: The converted local time string.
-   Returns an empty string if the input is invalid.



## Implementation

``` language-dart
String convertUTCToLocal(String utcTime) {
  try {
    final DateTime dateTime = DateTime.parse(utcTime).;
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  } catch (e) {
    print('Timezone Error converting UTC to local: $e $utcTime');
    return '';
  }
}
```







1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/)
3.  convertUTCToLocal function

##### time_conversion library







