:::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [weekDays]{.kind-property} property

</div>

:::: {.section .multi-line-signature}
[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}
[weekDays]{.name}

::: features
[getter/setter pair]{.feature}
:::
::::

::: {.section .desc .markdown}
represents the week days of the event.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Set<String> weekDays = {
  days[DateTime.now().weekday - 1],
};
```
:::
::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  weekDays property

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
