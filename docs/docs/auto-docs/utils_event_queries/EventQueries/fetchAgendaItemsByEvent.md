::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchAgendaItemsByEvent method

::: self-name
fetchAgendaItemsByEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAgendaItemsByEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchAgendaItemsByEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [relatedEventId]{.parameter-name}]{#fetchAgendaItemsByEvent-param-relatedEventId
    .parameter}

)
:::

::: {.section .desc .markdown}
Creates a GraphQL query for fetching agenda items by organization.

**params**:

-   `relatedEventId`: The ID of the event to fetch agenda items for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch agenda items.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchAgendaItemsByEvent(String relatedEventId) {
  return """
query {
  agendaItemByEvent(relatedEventId: "$relatedEventId") {
    _id
    title
    description
    duration
    attachments
    createdBy {
      _id
      firstName
      lastName
    }
    urls
    categories {
      _id
      name
    }
    sequence
    organization {
      _id
      name
    }
    relatedEvent {
      _id
      title
    }
  }
}
""";
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchAgendaItemsByEvent method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
