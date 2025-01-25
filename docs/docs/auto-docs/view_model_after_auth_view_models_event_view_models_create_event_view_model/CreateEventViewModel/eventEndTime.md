::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/create_event_view_model.dart](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  eventEndTime property

::: self-name
eventEndTime
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [eventEndTime]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)
[eventEndTime]{.name}

::: features
[getter/setter pair]{.feature}
:::
:::

::: {.section .desc .markdown}
Event End Time.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
TimeOfDay eventEndTime = TimeOfDay.now().replacing(
  hour: (TimeOfDay.now().hour + (TimeOfDay.now().minute >= 30 ? 1 : 0)) % 24,
  minute: (TimeOfDay.now().minute + 30) % 60,
);
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  eventEndTime property

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
