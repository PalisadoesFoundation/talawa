<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  fetchVolunteerGroupsByEvent method

<div class="self-name">

fetchVolunteerGroupsByEvent

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_event_service/EventService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">fetchVolunteerGroupsByEvent</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.md)</span>\></span></span>\></span></span>
<span class="name">fetchVolunteerGroupsByEvent</span>(

1.  <span id="fetchVolunteerGroupsByEvent-param-eventId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">eventId</span></span>

)

</div>

<div class="section desc markdown">

This function is used to fetch all volunteer groups for an event.

**params**:

- `eventId`: Id of the event to fetch volunteer groups.

**returns**:

- `Future<List<EventVolunteerGroup>>`: returns the list of volunteer
  groups

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<List<EventVolunteerGroup>> fetchVolunteerGroupsByEvent(
  String eventId,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  fetchVolunteerGroupsByEvent method

##### EventService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
