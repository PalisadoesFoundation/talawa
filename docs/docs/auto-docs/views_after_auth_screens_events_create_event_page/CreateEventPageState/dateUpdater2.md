::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html" below-sidebar=""}
<div>

# [dateUpdater2]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [dateUpdater2]{.name}(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [date]{.parameter-name}, ]{#dateUpdater2-param-date .parameter}
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#dateUpdater2-param-model .parameter}

)
:::

::: {.section .desc .markdown}
Handles the selection and deselection of categories.

**params**:

-   `date`: Date for event
-   `model`: Model to be updated

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void dateUpdater2(DateTime date, CreateEventViewModel model) {
  final startDate = model.eventStartDate;

  if (startDate.compareTo(date) < 0) {
    setState(() {
      if (model.eventEndDate != date) {
        model.eventEndDate = date;
        model.recurrenceLabel = 'Does not repeat';
        model.recurrenceEndDate = null;
        model.isRecurring = false;
        model.frequency = Frequency.weekly;
        model.weekDays = {};
        model.weekDayOccurenceInMonth = null;
      }
    });
  } else {
    navigationService.showSnackBar(
      "End Date cannot be after start date",
    );
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.html)
4.  dateUpdater2 method

##### CreateEventPageState class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
