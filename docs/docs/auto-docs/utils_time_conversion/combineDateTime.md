::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [utils/time_conversion.dart](../utils_time_conversion/)
3.  combineDateTime function

::: self-name
combineDateTime
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [combineDateTime]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[combineDateTime]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [date]{.parameter-name}, ]{#combineDateTime-param-date .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [time]{.parameter-name}]{#combineDateTime-param-time .parameter}

)
:::

::: {.section .desc .markdown}
Combines the given date and time strings into a single string.

**params**:

-   `date`: The date string in a valid date format (e.g.,
    \'YYYY-MM-DD\').
-   `time`: The time string in a valid time format (e.g., \'HH:MM:SS\').

**returns**:

-   `String`: A string that combines the `date` and `time`, separated by
    a space.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String combineDateTime(String date, String time) {
  return '$date $time';
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  combineDateTime function

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
