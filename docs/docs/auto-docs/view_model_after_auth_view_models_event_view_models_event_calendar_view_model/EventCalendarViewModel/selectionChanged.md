::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [selectionChanged]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [selectionChanged]{.name}(

1.  [[[DateRangePickerSelectionChangedArgs](https://pub.dev/documentation/syncfusion_flutter_datepicker/28.2.3/datepicker/DateRangePickerSelectionChangedArgs-class.html)]{.type-annotation}
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
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_calendar_view_model](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/)
3.  [EventCalendarViewModel](../../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
4.  selectionChanged method

##### EventCalendarViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
