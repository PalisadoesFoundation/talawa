::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [constants/recurrence_values.dart](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getWeekDayOccurenceInMonth static method

::: self-name
getWeekDayOccurenceInMonth
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html" below-sidebar=""}
<div>

# [getWeekDayOccurenceInMonth]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.returntype}
[getWeekDayOccurenceInMonth]{.name}(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [date]{.parameter-name}]{#getWeekDayOccurenceInMonth-param-date
    .parameter}

)
:::

::: {.section .desc .markdown}
\'getWeekDayOccurenceInMonth\' returns the week day occurence in month.

**params**:

-   `date`: Date of the event.

**returns**:

-   `int`: Week day occurence in month.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static int getWeekDayOccurenceInMonth(DateTime date) {
  final dayOfMonth = date.day;

  // Calculate the current occurrence
  final occurrence = (dayOfMonth / 7).ceil();

  return occurrence;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getWeekDayOccurenceInMonth static method

##### RecurrenceUtils class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
