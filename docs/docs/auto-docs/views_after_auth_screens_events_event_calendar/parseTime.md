::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [views/after_auth_screens/events/event_calendar.dart](../views_after_auth_screens_events_event_calendar/)
3.  parseTime function

::: self-name
parseTime
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_event_calendar/views_after_auth_screens_events_event_calendar-library-sidebar.html" below-sidebar=""}
<div>

# [parseTime]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.returntype}
[parseTime]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [time]{.parameter-name}]{#parseTime-param-time .parameter}

)
:::

::: {.section .desc .markdown}
a_line_ending_with_end_punctuation.

**params**:

-   `time`: define_the_param

**returns**:

-   `DateTime`: define_the_return
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
DateTime parseTime(String time) {
  try {
    return DateFormat('h:mm a', 'en_US').parse(time);
  } on FormatException {
    print('Caught FormatException: $time');
    try {
      return DateFormat('Hms').parse(time);
    } catch (e) {
      print('Caught error: $e');
      throw Exception('Invalid time format: $time');
    }
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [event_calendar](../views_after_auth_screens_events_event_calendar/)
3.  parseTime function

##### event_calendar library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
