




convertUTCToLocal function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../utils_time_conversion/utils_time_conversion-library.html)
3. convertUTCToLocal function

convertUTCToLocal


dark\_mode

light\_mode




# convertUTCToLocal function


String
convertUTCToLocal(

1. String utcTime

)

Converts the given UTC time to local time.

**params**:

* `utcTime`: The UTC time string in a valid format.

**returns**:

* `String`: The converted local time string.
* Returns an empty string if the input is invalid.

## Implementation

```
String convertUTCToLocal(String utcTime) {
  try {
    final DateTime dateTime = DateTime.parse(utcTime).toLocal();
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  } catch (e) {
    print('Timezone Error converting UTC to local: $e $utcTime');
    return '';
  }
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../utils_time_conversion/utils_time_conversion-library.html)
3. convertUTCToLocal function

##### time\_conversion library





talawa
1.0.0+1






