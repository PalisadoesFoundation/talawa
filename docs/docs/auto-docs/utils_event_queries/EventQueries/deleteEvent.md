<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/event_queries.dart](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  deleteEvent method

<div class="self-name">

deleteEvent

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_event_queries/EventQueries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">deleteEvent</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">deleteEvent</span>(

1.  <span id="deleteEvent-param-id"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">id</span></span>

)

</div>

<div class="section desc markdown">

Creates a GraphQL mutation for deleting an event.

**params**:

- `id`: The ID of the event to delete.

**returns**:

- `String`: Returns a GraphQL mutation string to delete the specified
  event.

This function generates a GraphQL mutation string for removing/deleting
an event based on the provided event ID.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String deleteEvent(String id) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/utils_event_queries-library.md)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  deleteEvent method

##### EventQueries class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
