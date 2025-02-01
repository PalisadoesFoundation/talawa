::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [constants/recurrence_values.dart](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.html)
4.  getRecurrenceRuleText static method

::: self-name
getRecurrenceRuleText
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html" below-sidebar=""}
<div>

# [getRecurrenceRuleText]{.kind-method} static method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[getRecurrenceRuleText]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [frequency]{.parameter-name},
    ]{#getRecurrenceRuleText-param-frequency .parameter}
2.  [[[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [weekDays]{.parameter-name}, ]{#getRecurrenceRuleText-param-weekDays
    .parameter}
3.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [interval]{.parameter-name}, ]{#getRecurrenceRuleText-param-interval
    .parameter}
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [count]{.parameter-name}, ]{#getRecurrenceRuleText-param-count
    .parameter}
5.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [weekDayOccurenceInMonth]{.parameter-name},
    ]{#getRecurrenceRuleText-param-weekDayOccurenceInMonth .parameter}
6.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [startDate]{.parameter-name},
    ]{#getRecurrenceRuleText-param-startDate .parameter}
7.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.type-annotation}
    [endDate]{.parameter-name}, ]{#getRecurrenceRuleText-param-endDate
    .parameter}

)
:::

::: {.section .desc .markdown}
\'getRecurrenceRuleText\' return text for various recurrence rules.

**params**:

-   `frequency`: Frequency of the event.
-   `weekDays`: List of week days.
-   `interval`: Interval of the event.
-   `count`: Count of the event.
-   `weekDayOccurenceInMonth`: Week day occurence in month.
-   `startDate`: Start date of the event.
-   `endDate`: End date of the event.

**returns**:

-   `String`: Recurrence rule text.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
static String getRecurrenceRuleText(
  String frequency,
  Set<String>? weekDays,
  int? interval,
  int? count,
  int? weekDayOccurenceInMonth,
  DateTime startDate,
  DateTime? endDate,
) {
  String recurrenceRuleText = '';

  switch (frequency) {
    case Frequency.daily:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval days';
      } else {
        recurrenceRuleText = 'Daily';
      }
      break;
    case Frequency.weekly:
      if (weekDays == null) {
        break;
      }
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval weeks on ';
      } else {
        recurrenceRuleText = 'Weekly on ';
      }
      recurrenceRuleText += getWeekDaysString(weekDays.toList());
      break;
    case Frequency.monthly:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval months on ';
      } else {
        recurrenceRuleText = 'Monthly on ';
      }

      if (weekDayOccurenceInMonth != null) {
        final getOccurence =
            weekDayOccurenceInMonth != -1 ? weekDayOccurenceInMonth - 1 : 4;
        recurrenceRuleText +=
            '${weekDayOccurences[getOccurence]} ${RecurrenceUtils.weekDays[startDate.weekday - 1]}';
      } else {
        recurrenceRuleText += 'Day ${startDate.day}';
      }
      break;
    case Frequency.yearly:
      if (interval != null && interval > 1) {
        recurrenceRuleText = 'Every $interval years on ';
      } else {
        recurrenceRuleText = 'Annually on ';
      }
      recurrenceRuleText +=
          '${monthNames[startDate.month - 1]} ${startDate.day}';
      break;
  }

  if (endDate != null) {
    final formatter = DateFormat('MMMM dd, yyyy');
    recurrenceRuleText += ', until ${formatter.format(endDate)}';
  }

  if (count != null) {
    recurrenceRuleText += ', $count ${count > 1 ? 'times' : 'time'}';
  }

  return recurrenceRuleText;
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
4.  getRecurrenceRuleText static method

##### RecurrenceUtils class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
