




traverseAndConvertDates function - time\_conversion library - Dart API







menu

1. [talawa](../index.html)
2. [utils/time\_conversion.dart](../utils_time_conversion/utils_time_conversion-library.html)
3. traverseAndConvertDates function

traverseAndConvertDates


dark\_mode

light\_mode




# traverseAndConvertDates function


void
traverseAndConvertDates(

1. Map<String, dynamic> obj,
2. String convertFn(
   1. String),
3. Map<String, String> splitFn(
   1. String)

)

Traverses a nested map and converts date and time fields to the desired format.

**params**:

* `obj`: The nested map to traverse and convert.
* `convertFn`: A function that converts a combined date and time string to the desired format.
* `splitFn`: A function that splits a converted date and time string into separate date and time strings.

**returns**:
None


## Implementation

```
void traverseAndConvertDates(
  Map<String, dynamic> obj,
  String Function(String) convertFn,
  Map<String, String> Function(String) splitFn,
) {
  obj.forEach((key, value) {
    final pairedFields =
        dateTimeFields['pairedFields']?.cast<Map<String, String>>();
    if (pairedFields != null) {
      for (final field in pairedFields) {
        if (key == field['dateField'] && obj.containsKey(field['timeField'])) {
          final combinedDateTime = combineDateTime(
            obj[field['dateField']] as String,
            obj[field['timeField']] as String,
          );

          final convertedDateTime = convertFn(combinedDateTime);

          final splitDateTime = splitFn(convertedDateTime);

          obj[field['dateField'] ?? ''] = splitDateTime['date'] ?? '';
          obj[field['timeField'] ?? ''] = splitDateTime['time'] ?? '';
        }
      }
    }

    if (dateTimeFields['directFields']?.cast<String>().contains(key) ?? false) {
      obj[key] = convertFn(value as String);
    }

    if (value is Map<String, dynamic>) {
      traverseAndConvertDates(value, convertFn, splitFn);
    } else if (value is List) {
      for (final item in value) {
        if (item is Map<String, dynamic>) {
          traverseAndConvertDates(item, convertFn, splitFn);
        }
      }
    }
  });
}
```

 


1. [talawa](../index.html)
2. [time\_conversion](../utils_time_conversion/utils_time_conversion-library.html)
3. traverseAndConvertDates function

##### time\_conversion library





talawa
1.0.0+1






