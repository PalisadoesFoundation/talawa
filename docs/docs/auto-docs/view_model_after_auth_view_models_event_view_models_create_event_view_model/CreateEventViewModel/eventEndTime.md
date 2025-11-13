<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/event_view_models/create_event_view_model.dart](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
4.  eventEndTime property

<div class="self-name">

eventEndTime

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">eventEndTime</span> property

</div>

<div class="section multi-line-signature">

[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)
<span class="name">eventEndTime</span>

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div class="section desc markdown">

Event End Time.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
TimeOfDay eventEndTime = TimeOfDay..replacing(
  hour: (TimeOfDay..hour + (TimeOfDay..minute >= 30 ? 1 : 0)) % 24,
  minute: (TimeOfDay..minute + 30) % 60,
);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
4.  eventEndTime property

##### CreateEventViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
