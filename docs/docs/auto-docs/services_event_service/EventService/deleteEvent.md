::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [deleteEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[deleteEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#deleteEvent-param-eventId .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to delete the event.

**params**:

-   `eventId`: id of an event

**returns**:

-   `Future<QueryResult<Object?>>`: Information about the event deletion
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> deleteEvent(String eventId) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().deleteEvent(eventId),
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
4.  deleteEvent method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
