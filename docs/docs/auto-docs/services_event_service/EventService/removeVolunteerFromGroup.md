<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/event_service.dart](../../services_event_service/services_event_service-library.md)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  removeVolunteerFromGroup method

<div class="self-name">

removeVolunteerFromGroup

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_event_service/EventService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">removeVolunteerFromGroup</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)</span>
<span class="name">removeVolunteerFromGroup</span>(

1.  <span id="removeVolunteerFromGroup-param-variables"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span></span>
    <span class="parameter-name">variables</span></span>

)

</div>

<div class="section desc markdown">

This function is used to remove a volunteer from a group.

**params**:

- `variables`: this will be `map` type and contain the ID of the
  volunteer to be removed.

**returns**:

- `Future<dynamic>`: Information about the removed volunteer.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<dynamic> removeVolunteerFromGroup(
  Map<String, dynamic> variables,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/services_event_service-library.md)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  removeVolunteerFromGroup method

##### EventService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
