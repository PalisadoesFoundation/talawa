::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  changeView method

::: self-name
changeView
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [changeView]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [changeView]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [view]{.parameter-name}]{#changeView-param-view .parameter}

)
:::

::: {.section .desc .markdown}
Changes the view of the calendar.

**params**:

-   `view`: String representing the desired view (\"Day\", \"Month\",
    \"Schedule\").

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void changeView(String view) {
  switch (view) {
    case "Day":
      _calendarView = CalendarView.day;
      break;
    case "Month":
      _calendarView = CalendarView.month;
      break;
    case "Schedule":
      _calendarView = CalendarView.schedule;
      break;
    default:
      break;
  }
  calendarController.view = _calendarView;
  notifyListeners();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  changeView method

##### EventCalendarViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
