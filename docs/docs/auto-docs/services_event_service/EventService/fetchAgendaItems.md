::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchAgendaItems method

::: self-name
fetchAgendaItems
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAgendaItems]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[fetchAgendaItems]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#fetchAgendaItems-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to fetch all agenda items for a specific
organization.

**params**:

-   `eventId`: ID of the event to fetch agenda items.

**returns**:

-   `Future<dynamic>`: A list of agenda items for the specified
    organization.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> fetchAgendaItems(String eventId) async {
  final result = await _dbFunctions.gqlAuthQuery(
    EventQueries().fetchAgendaItemsByEvent(eventId),
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
4.  fetchAgendaItems method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
