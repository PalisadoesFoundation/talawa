<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  fetchAgendaItemsByEvent method

<div class="self-name">

fetchAgendaItemsByEvent

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

# <span class="kind-method">fetchAgendaItemsByEvent</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">fetchAgendaItemsByEvent</span>(

1.  <span id="fetchAgendaItemsByEvent-param-relatedEventId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">relatedEventId</span></span>

)

</div>

<div class="section desc markdown">

Creates a GraphQL query for fetching agenda items by organization.

**params**:

- `relatedEventId`: The ID of the event to fetch agenda items for.

**returns**:

- `String`: Returns a GraphQL query string to fetch agenda items.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String fetchAgendaItemsByEvent(String relatedEventId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  fetchAgendaItemsByEvent method

##### EventQueries class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
