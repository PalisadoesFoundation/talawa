
<div>

# splitDateTimeUTC function

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]]
splitDateTimeUTC(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    dateTimeStr]

)



Splits the given UTC date and time string into separate date and time
strings.

**params**:

-   `dateTimeStr`: The UTC date and time string in a valid format.

**returns**:

-   `Map<String, String>`: A map containing the separate date and time
    strings.
-   Returns an empty map if the input is invalid.



## Implementation

``` language-dart
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







1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  splitDateTimeUTC function

##### time_conversion library







