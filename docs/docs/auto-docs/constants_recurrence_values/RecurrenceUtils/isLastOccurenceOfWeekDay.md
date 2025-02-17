::::::: {#dartdoc-main-content .main-content above-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html" below-sidebar=""}
<div>

# [isLastOccurenceOfWeekDay]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[isLastOccurenceOfWeekDay]{.name}(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [date]{.parameter-name}]{#isLastOccurenceOfWeekDay-param-date
    .parameter}

)
:::

::: {.section .desc .markdown}
Function to check whether cuurent event instance is Last occurence of
Week Day.

**params**:

-   `date`: Date of the event.

**returns**:

-   `bool`: Returns true if the current event instance is the last
    occurence of the week day.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static bool isLastOccurenceOfWeekDay(DateTime date) {
  final currentDay = date.weekday;

  DateTime lastOccurenceInMonth = DateTime(
    date.year,
    date.month + 1,
    0,
  );

  // set the lastOccurenceInMonth to that day's last occurence
  while (lastOccurenceInMonth.weekday != currentDay) {
    lastOccurenceInMonth = DateTime(
      lastOccurenceInMonth.year,
      lastOccurenceInMonth.month,
      lastOccurenceInMonth.day - 1,
    );
  }

  return date.day == lastOccurenceInMonth.day;
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
4.  isLastOccurenceOfWeekDay static method

##### RecurrenceUtils class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
