<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  attendeesByEvent method

<div class="self-name">

attendeesByEvent

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_event_queries/EventQueries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">attendeesByEvent</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">attendeesByEvent</span>(

1.  <span id="attendeesByEvent-param-eventId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">eventId</span></span>

)

</div>

<div class="section desc markdown">

Fetches attendees by event ID.

**params**:

- `eventId`: The ID of the event to fetch registrants for.

**returns**:

- `String`: Returns a GraphQL query string to retrieve registrants
  associated with the specified event ID.

This function generates a GraphQL query string to fetch registrants
based on the provided event ID.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String attendeesByEvent(String eventId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  attendeesByEvent method

##### EventQueries class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
