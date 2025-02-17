::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchOrgEvents]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchOrgEvents]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}]{#fetchOrgEvents-param-orgId .parameter}

)
:::

::: {.section .desc .markdown}
Fetches events by organization ID.

**params**:

-   `orgId`: The ID of the organization to fetch events for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch events associated
    with the specified organization ID.

This function generates a GraphQL query string to retrieve events based
on the provided organization ID.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchOrgEvents(String orgId) {
  return """
    query {
      eventsByOrganizationConnection(
    where: {
      organization_id: "$orgId"
    }
  ) {
    _id
    organization {
      _id
      image
    }
    title
    description
    isPublic
    isRegisterable
    recurring
    startDate
    endDate
    allDay
    startTime
    endTime
    location
    creator {
      _id
      firstName
      lastName
    }
    admins {
      _id
      firstName
      lastName
    }
    attendees {
      _id
      firstName
      lastName
      image
    }
  }
    }
  """;
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
4.  fetchOrgEvents method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
