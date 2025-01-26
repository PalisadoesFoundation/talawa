::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [views/after_auth_screens/events/event_calendar.dart](../../views_after_auth_screens_events_event_calendar/)
3.  [EventCalendar](../../views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4.  calendarViewSelection method

::: self-name
calendarViewSelection
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_event_calendar/EventCalendar-class-sidebar.html" below-sidebar=""}
<div>

# [calendarViewSelection]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[PopupMenuButton](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[calendarViewSelection]{.name}(

1.  [[[EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#calendarViewSelection-param-model
    .parameter}

)
:::

::: {.section .desc .markdown}
Popupmenu Button to select calendar view.

**params**:

-   `model`: EventCalendarViewModel.

**returns**:

-   `PopupMenuButton<String>`: custom PopupMenuButton..
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
PopupMenuButton<String> calendarViewSelection(EventCalendarViewModel model) {
  final List<String> views = ["Day", "Month", "Schedule"];
  return PopupMenuButton<String>(
    itemBuilder: (context) {
      return <PopupMenuEntry<String>>[
        for (final view in views)
          PopupMenuItem(
            value: view,
            child: Text(view),
          ),
      ];
    },
    onSelected: (value) {
      model.changeView(value);
    },
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_calendar](../../views_after_auth_screens_events_event_calendar/)
3.  [EventCalendar](../../views_after_auth_screens_events_event_calendar/EventCalendar-class.html)
4.  calendarViewSelection method

##### EventCalendar class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
