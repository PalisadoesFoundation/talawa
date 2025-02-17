::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html" below-sidebar=""}
<div>

# [dateUpdater1]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [dateUpdater1]{.name}(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [date]{.parameter-name}, ]{#dateUpdater1-param-date .parameter}
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#dateUpdater1-param-model .parameter}

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
void dateUpdater1(DateTime date, CreateEventViewModel model) {
  if (date.isBefore(DateTime.now())) {
    navigationService.showSnackBar(
      "Cannot create events having date prior than today",
    );
  } else {
    setState(() {
      if (model.eventStartDate != date) {
        model.eventStartDate = date;
        model.recurrenceStartDate = date;
        model.recurrenceLabel = 'Does not repeat';
        model.isRecurring = false;
        model.frequency = Frequency.weekly;
        model.weekDays = {};
        model.weekDayOccurenceInMonth = null;
      }
    });
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
4.  dateUpdater1 method

##### CreateEventPageState class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
