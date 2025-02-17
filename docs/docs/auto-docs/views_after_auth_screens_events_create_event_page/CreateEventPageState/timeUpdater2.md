::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html" below-sidebar=""}
<div>

# [timeUpdater2]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [timeUpdater2]{.name}(

1.  [[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation}
    [time]{.parameter-name}, ]{#timeUpdater2-param-time .parameter}
2.  [[[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}]{#timeUpdater2-param-model .parameter}

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
void timeUpdater2(TimeOfDay time, CreateEventViewModel model) {
  final validationError = Validator.validateEventTime(
    model.eventStartTime,
    time,
  );
  final showSnackBar = navigationService.showTalawaErrorSnackBar;
  if (validationError != null) {
    showSnackBar(
      'Start time must be before end time',
      MessageType.error,
    );
  } else {
    setState(() {
      model.eventEndTime = time;
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
4.  timeUpdater2 method

##### CreateEventPageState class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
