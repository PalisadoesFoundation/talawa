::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  registerForAnEvent method

::: self-name
registerForAnEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [registerForAnEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[registerForAnEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#registerForAnEvent-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to register user for an event.

**params**:

-   `eventId`: id of an event.

**returns**:

-   `Future<dynamic>`: Information about the event registration.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> registerForAnEvent(String eventId) async {
  final Map<String, dynamic> variables = {'eventId': eventId};
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().registerForEvent(),
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
4.  registerForAnEvent method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
