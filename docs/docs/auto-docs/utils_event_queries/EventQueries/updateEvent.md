::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  updateEvent method

::: self-name
updateEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [updateEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[updateEvent]{.name}({

1.  [[dynamic]{.type-annotation} [eventId]{.parameter-name},
    ]{#updateEvent-param-eventId .parameter}

})
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for updating an event.

**params**:

-   `eventId`: The ID of the event to update.

**returns**:

-   `String`: Returns a GraphQL mutation string to update the specified
    event.

This function generates a GraphQL mutation string for updating an event
based on the provided parameters. It takes the event ID along with
updated details. The mutation updates the event details and returns the
ID, title, and description of the updated event.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String updateEvent({
  eventId,
}) {
  return """mutation updateEvent(
      \$title:String!,
      \$description: String!,
      \$startTime: Time,
      \$endTime: Time,
      \$allDay: Boolean!,
      \$recurring: Boolean!,
      \$isPublic: Boolean!,
      \$isRegisterable: Boolean!,
      \$location: String,
    ) {
    updateEvent(
       id: "$eventId"
       data:{
         title: \$title,
         description: \$description,
         isPublic: \$isPublic,
         isRegisterable: \$isRegisterable,
         recurring: \$recurring,
         allDay: \$allDay,
         startTime: \$startTime
         endTime: \$endTime
         location: \$location
       }
       ){
          _id
          title
          description
        }
    }""";
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
4.  updateEvent method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
