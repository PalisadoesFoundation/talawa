::::::: {#dartdoc-main-content .main-content above-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html" below-sidebar=""}
<div>

# [getWeekDaysString]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getWeekDaysString]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [weekDays]{.parameter-name}]{#getWeekDaysString-param-weekDays
    .parameter}

)
:::

::: {.section .desc .markdown}
\'getWeekDaysString\' returns string for weekDays.

**params**:

-   `weekDays`: List of Weekdays

**returns**:

-   `String`: returns string for weekDays.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String getWeekDaysString(List<String> weekDays) {
  final fullDayNames = weekDays
      .map((day) => RecurrenceUtils.weekDays[weekDays.indexOf(day)])
      .toList();

  String weekDaysString = fullDayNames.join(', ');

  final lastCommaIndex = weekDaysString.lastIndexOf(',');
  if (lastCommaIndex != -1) {
    weekDaysString =
        '${weekDaysString.substring(0, lastCommaIndex)} &${weekDaysString.substring(lastCommaIndex + 1)}';
  }

  return weekDaysString;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getWeekDaysString static method

##### RecurrenceUtils class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
