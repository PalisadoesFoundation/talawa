::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAttendeesByEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[fetchAttendeesByEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#fetchAttendeesByEvent-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to fetch all registrants of an event.

**params**:

-   `eventId`: id of an event.

**returns**:

-   `Future<dynamic>`: Information about event registrants.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> fetchAttendeesByEvent(String eventId) async {
  final result = await _dbFunctions.gqlAuthQuery(
    EventQueries().attendeesByEvent(eventId),
  );
  return result;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchAttendeesByEvent method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
