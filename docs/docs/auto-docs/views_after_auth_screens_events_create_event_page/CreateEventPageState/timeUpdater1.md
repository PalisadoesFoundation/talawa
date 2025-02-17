::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html" below-sidebar=""}
<div>

# [timeUpdater1]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [timeUpdater1]{.name}(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation}
    [time]{.parameter-name}, ]{#timeUpdater1-param-time .parameter}
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#timeUpdater1-param-model .parameter}

)
:::

::: {.section .desc .markdown}
Handles the selection and deselection of categories.

**params**:

-   `time`: Time for event
-   `model`: Model to be updated

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void timeUpdater1(TimeOfDay time, CreateEventViewModel model) {
  final validationError = Validator.validateEventTime(
    time,
    model.eventEndTime,
  );

  if (validationError != null) {
    navigationService.showTalawaErrorSnackBar(
      'Start time must be before end time',
      MessageType.error,
    );
  } else {
    setState(() {
      model.eventStartTime = time;
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
4.  timeUpdater1 method

##### CreateEventPageState class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
