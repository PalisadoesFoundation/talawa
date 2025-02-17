::::::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [convertLocalToUTC]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[convertLocalToUTC]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [localTime]{.parameter-name}]{#convertLocalToUTC-param-localTime
    .parameter}

)
:::

::: {.section .desc .markdown}
Converts the given local time to UTC time.

**params**:

-   `localTime`: The local time string in a valid format.

**returns**:

-   `String`: The converted UTC time string.
-   Returns an empty string if the input is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  convertLocalToUTC function

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
