<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.md)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.md)
4.  updateVolunteerGroup method

<div class="self-name">

updateVolunteerGroup

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">updateVolunteerGroup</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">updateVolunteerGroup</span>(

1.  <span id="updateVolunteerGroup-param-group"
    class="parameter"><span class="type-annotation">[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.md)</span>
    <span class="parameter-name">group</span>, </span>
2.  <span id="updateVolunteerGroup-param-eventId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">eventId</span>, </span>
3.  <span id="updateVolunteerGroup-param-name"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">name</span>, </span>
4.  <span id="updateVolunteerGroup-param-volunteersRequired"
    class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>
    <span class="parameter-name">volunteersRequired</span>, </span>

)

</div>

<div class="section desc markdown">

Updates the details of a volunteer group.

**params**:

- `group`: The volunteer group to update.
- `eventId`: The ID of the event.
- `name`: The new name for the group.
- `volunteersRequired`: The new number of volunteers required.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> updateVolunteerGroup(
  EventVolunteerGroup group,
  String eventId,
  String name,
  int volunteersRequired,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.md)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.md)
4.  updateVolunteerGroup method

##### ManageVolunteerGroupViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
