::::::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [traverseAndConvertDates]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [traverseAndConvertDates]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [obj]{.parameter-name}, ]{#traverseAndConvertDates-param-obj
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [convertFn]{.parameter-name}(]{#traverseAndConvertDates-param-convertFn
    .parameter}
    1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}]{#param-
        .parameter}

    ),
3.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [splitFn]{.parameter-name}(]{#traverseAndConvertDates-param-splitFn
    .parameter}
    1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}]{#param-
        .parameter}

    )

)
:::

::: {.section .desc .markdown}
Traverses a nested map and converts date and time fields to the desired
format.

**params**:

-   `obj`: The nested map to traverse and convert.
-   `convertFn`: A function that converts a combined date and time
    string to the desired format.
-   `splitFn`: A function that splits a converted date and time string
    into separate date and time strings.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  traverseAndConvertDates function

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
