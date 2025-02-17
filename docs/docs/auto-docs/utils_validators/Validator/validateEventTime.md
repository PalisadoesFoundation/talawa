::::::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/Validator-class-sidebar.html" below-sidebar=""}
<div>

# [validateEventTime]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[validateEventTime]{.name}(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation}
    [startTime]{.parameter-name}, ]{#validateEventTime-param-startTime
    .parameter}
2.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation}
    [endTime]{.parameter-name}]{#validateEventTime-param-endTime
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to validate event time.

**params**:

-   `startTime`: the start time of the event
-   `endTime`: the end time of the event

**returns**:

-   `String?`: error message if time is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) {
  if (startTime.hour > endTime.hour ||
      (startTime.hour == endTime.hour && startTime.minute > endTime.minute)) {
    return 'Start time must be before or equal to end time';
  }
  return null;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.html)
4.  validateEventTime static method

##### Validator class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
