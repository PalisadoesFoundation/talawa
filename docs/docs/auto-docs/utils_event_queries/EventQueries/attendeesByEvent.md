::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [attendeesByEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[attendeesByEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#attendeesByEvent-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
Fetches attendees by event ID.

**params**:

-   `eventId`: The ID of the event to fetch registrants for.

**returns**:

-   `String`: Returns a GraphQL query string to retrieve registrants
    associated with the specified event ID.

This function generates a GraphQL query string to fetch registrants
based on the provided event ID.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String attendeesByEvent(String eventId) {
  return '''
    query {
      getEventAttendeesByEventId(eventId: "$eventId") {
        eventId
        userId
        isRegistered
        isInvited
        isCheckedIn
        isCheckedOut
      }
    }
  ''';
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  attendeesByEvent method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
