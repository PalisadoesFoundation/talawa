::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchAgendaItemCategoriesByOrganization method

::: self-name
fetchAgendaItemCategoriesByOrganization
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAgendaItemCategoriesByOrganization]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchAgendaItemCategoriesByOrganization]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [organizationId]{.parameter-name}]{#fetchAgendaItemCategoriesByOrganization-param-organizationId
    .parameter}

)
:::

::: {.section .desc .markdown}
Creates a GraphQL query for fetching agenda item categories by
organization.

**params**:

-   `organizationId`: The ID of the organization to fetch agenda item
    categories for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch agenda item
    categories.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchAgendaItemCategoriesByOrganization(String organizationId) {
  return """
  query {
    agendaItemCategoriesByOrganization(organizationId: "$organizationId") {
      _id
      name
      description

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
4.  fetchAgendaItemCategoriesByOrganization method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
