<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [models/events/event_model.dart](../../models_events_event_model/models_events_event_model-library.md)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endDate property

<div class="self-name">

endDate

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_events_event_model/Event-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">endDate</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>
<span class="name">endDate</span>

</div>

<div class="section desc markdown">

Computed property: formatted end date (e.g. "2025-07-31").

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String? get endDate =>
    endAt != null ? DateFormat('yyyy-MM-dd').format(endAt!) : null;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/models_events_event_model-library.md)
3.  [Event](../../models_events_event_model/Event-class.md)
4.  endDate property

##### Event class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
