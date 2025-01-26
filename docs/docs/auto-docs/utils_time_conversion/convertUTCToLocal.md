::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [utils/time_conversion.dart](../utils_time_conversion/)
3.  convertUTCToLocal function

::: self-name
convertUTCToLocal
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [convertUTCToLocal]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[convertUTCToLocal]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [utcTime]{.parameter-name}]{#convertUTCToLocal-param-utcTime
    .parameter}

)
:::

::: {.section .desc .markdown}
Converts the given UTC time to local time.

**params**:

-   `utcTime`: The UTC time string in a valid format.

**returns**:

-   `String`: The converted local time string.
-   Returns an empty string if the input is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  convertUTCToLocal function

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
