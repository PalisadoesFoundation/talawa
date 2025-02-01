::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  selectionChanged method

::: self-name
selectionChanged
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [selectionChanged]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [selectionChanged]{.name}(

1.  [[[DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/27.2.5/datepicker/DateRangePickerSelectionChangedArgs-class.html)]{.type-annotation}
    [args]{.parameter-name}]{#selectionChanged-param-args .parameter}

)
:::

::: {.section .desc .markdown}
function to be triggered when selection is changed.

**params**:

-   `args`: Object of type DateRangePickerSelectionChangedArgs, The
    selected dates or ranges changes in the SfDateRangePicker.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    _calendarController.displayDate = args.value as DateTime?;
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
4.  selectionChanged method

##### EventCalendarViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
