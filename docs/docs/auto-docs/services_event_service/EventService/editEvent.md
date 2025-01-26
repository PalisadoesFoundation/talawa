::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  editEvent method

::: self-name
editEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [editEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[editEvent]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}, ]{#editEvent-param-eventId .parameter}
2.  [required
    [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [variables]{.parameter-name}, ]{#editEvent-param-variables
    .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to edit an event.

**params**:

-   `eventId`: id of an event
-   `variables`: this will be `map` type and contain all the event
    details need to be update.

**returns**:

-   `Future<QueryResult<Object?>>`: Information about the event
    deletion.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> editEvent({
  required String eventId,
  required Map<String, dynamic> variables,
}) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateEvent(eventId: eventId),
    variables: variables,
  );
  return result;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  editEvent method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
