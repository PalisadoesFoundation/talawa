::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  viewChanged method

::: self-name
viewChanged
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [viewChanged]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [viewChanged]{.name}(

1.  [[[ViewChangedDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/27.2.5/calendar/ViewChangedDetails-class.html)]{.type-annotation}
    [viewChangedDetails]{.parameter-name}]{#viewChanged-param-viewChangedDetails
    .parameter}

)
:::

::: {.section .desc .markdown}
The function to triggered when the view is changed.

**params**:

-   `viewChangedDetails`: The dates that visible on the view changes in
    SfCalendar. type is ViewChangedDetails

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void viewChanged(ViewChangedDetails viewChangedDetails) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _dateRangePickerController.selectedDate =
        viewChangedDetails.visibleDates[0];
    _dateRangePickerController.displayDate =
        viewChangedDetails.visibleDates[0];
  });
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
4.  viewChanged method

##### EventCalendarViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
