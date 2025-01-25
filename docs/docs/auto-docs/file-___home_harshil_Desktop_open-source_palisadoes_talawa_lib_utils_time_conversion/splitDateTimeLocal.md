




splitDateTimeLocal function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. splitDateTimeLocal function

splitDateTimeLocal


dark\_mode

light\_mode




# splitDateTimeLocal function


[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [String](https://api.flutter.dev/flutter/dart-core/String-class.html)>
splitDateTimeLocal(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) dateTimeStr

)

Splits the given local date and time string into separate date and time strings.

**params**:

* `dateTimeStr`: The local date and time string in a valid format.

**returns**:

* `Map<String, String>`: A map containing the separate date and time strings.
* Returns an empty map if the input is invalid.

## Implementation

```
Map<String, String> splitDateTimeLocal(String dateTimeStr) {
  try {
    final DateTime dateTime = DateTime.parse(dateTimeStr);
    return {
      'date': DateFormat('yyyy-MM-dd').format(dateTime),
      'time': DateFormat('HH:mm').format(dateTime),
    };
  } catch (e) {
    print('Timezone Error parsing local date time: $e $dateTimeStr');
    return {};
  }
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_time_conversion/)
3. splitDateTimeLocal function

##### time\_conversion library





talawa
1.0.0+1






