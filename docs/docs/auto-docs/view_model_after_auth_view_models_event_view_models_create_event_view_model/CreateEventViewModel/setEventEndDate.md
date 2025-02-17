::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setEventEndDate]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setEventEndDate]{.name}(

1.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [selectedEndDate]{.parameter-name}]{#setEventEndDate-param-selectedEndDate
    .parameter}

)
:::

::: {.section .desc .markdown}
Updates the event end date to selected event end date.

**params**:

-   `selectedEndDate`: new event end date selected by user.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setEventEndDate(DateTime selectedEndDate) {
  eventEndDate = selectedEndDate;
  notifyListeners();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  setEventEndDate method

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
