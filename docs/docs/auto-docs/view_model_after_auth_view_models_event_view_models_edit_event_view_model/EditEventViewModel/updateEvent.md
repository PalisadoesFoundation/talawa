<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [edit_event_view_model](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library.md)
3.  [EditEventViewModel](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.md)
4.  updateEvent method

<div class="self-name">

updateEvent

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">updateEvent</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">updateEvent</span>

</div>

<div class="section desc markdown">

Updates an existing event with the data from the form.

This method performs the following actions:

1.  Unfocuses all text fields and sets form validation mode to always.
2.  Validates the form. If valid, it constructs a map of event details
    including start and end dates and times, and other attributes.
3.  Displays a loading dialog while the API request is being processed.
4.  Calls the service method to update the event with the provided data.
5.  On success, navigates to the explore events screen.
6.  On success, also updates the UI and removes the loading dialog.

**params**: None

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [edit_event_view_model](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/view_model_after_auth_view_models_event_view_models_edit_event_view_model-library.md)
3.  [EditEventViewModel](../../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.md)
4.  updateEvent method

##### EditEventViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
