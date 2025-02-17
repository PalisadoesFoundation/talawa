::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [createVolunteerGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[createVolunteerGroup]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for creating an event volunteer group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to create an event
    volunteer group.

This function generates a GraphQL mutation string for creating an event
volunteer group.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String createVolunteerGroup() {
  return '''
mutation CreateEventVolunteerGroup(\$data: EventVolunteerGroupInput!) {
  createEventVolunteerGroup(data: \$data) {
    _id
    name
    volunteers{
    _id
    }
    createdAt
    volunteersRequired
    creator{
    _id
    }
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
4.  createVolunteerGroup method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
