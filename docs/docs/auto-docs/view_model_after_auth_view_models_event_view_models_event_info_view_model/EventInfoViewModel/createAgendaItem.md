<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.md)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  createAgendaItem method

<div class="self-name">

createAgendaItem

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">createAgendaItem</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.md)?</span>\></span></span>
<span class="name">createAgendaItem</span>(

1.  <span id="createAgendaItem-param-title" class="parameter"></span>

)

</div>

<div class="section desc markdown">

This function is used to create a new agenda item for an event.

**params**:

- `title`: Title of the agenda item.
- `description`: Description of the agenda item (optional).
- `duration`: Duration of the agenda item.
- `attachments`: List of attachment URLs (optional).
- `urls`: List of related URLs (optional).
- `categories`: List of category IDs (optional).
- `sequence`: Sequence number of the agenda item.
- `itemType`: Type of the agenda item.
- `isNote`: Whether the agenda item is a note or not.

**returns**:

- `Future<EventAgendaItem?>`: Returns the new agenda item if creation is
  successful.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<EventAgendaItem?>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.md)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  createAgendaItem method

##### EventInfoViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
