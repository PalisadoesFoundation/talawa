




splitDateTimeUTC function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. splitDateTimeUTC function

splitDateTimeUTC


dark\_mode

light\_mode




# splitDateTimeUTC function


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>
splitDateTimeUTC(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) dateTimeStr

)

Splits the given UTC date and time string into separate date and time strings.

**params**:

* `dateTimeStr`: The UTC date and time string in a valid format.

**returns**:

* `Map<String, String>`: A map containing the separate date and time strings.
* Returns an empty map if the input is invalid.

## Implementation

```
Map<String, String> splitDateTimeUTC(String dateTimeStr) {
  try {
    final DateTime dateTime = DateTime.parse(dateTimeStr);
    return {
      'date': DateFormat('yyyy-MM-dd').format(dateTime),
      'time': DateFormat("HH:mm:ss.SSS'Z'").format(dateTime),
    };
  } catch (e) {
    print('Timezone Error parsing UTC date time: $e $dateTimeStr');
    return {};
  }
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. splitDateTimeUTC function

##### time\_conversion library





talawa
1.0.0+1






