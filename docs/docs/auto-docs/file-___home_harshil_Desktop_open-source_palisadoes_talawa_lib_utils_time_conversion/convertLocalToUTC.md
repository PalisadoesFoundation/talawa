




convertLocalToUTC function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. convertLocalToUTC function

convertLocalToUTC


dark\_mode

light\_mode




# convertLocalToUTC function


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
convertLocalToUTC(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) localTime

)

Converts the given local time to UTC time.

**params**:

* `localTime`: The local time string in a valid format.

**returns**:

* `String`: The converted UTC time string.
* Returns an empty string if the input is invalid.

## Implementation

```
String convertLocalToUTC(String localTime) {
  try {
    final DateTime dateTime = DateTime.parse(localTime).toUtc();
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime);
  } catch (e) {
    print('Timezone Error converting local to UTC: $e $localTime');
    return '';
  }
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. convertLocalToUTC function

##### time\_conversion library





talawa
1.0.0+1






