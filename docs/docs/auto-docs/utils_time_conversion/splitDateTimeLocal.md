::::::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [splitDateTimeLocal]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[splitDateTimeLocal]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [dateTimeStr]{.parameter-name}]{#splitDateTimeLocal-param-dateTimeStr
    .parameter}

)
:::

::: {.section .desc .markdown}
Splits the given local date and time string into separate date and time
strings.

**params**:

-   `dateTimeStr`: The local date and time string in a valid format.

**returns**:

-   `Map<String, String>`: A map containing the separate date and time
    strings.
-   Returns an empty map if the input is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  splitDateTimeLocal function

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
