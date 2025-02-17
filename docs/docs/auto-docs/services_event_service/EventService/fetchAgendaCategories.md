::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchAgendaCategories]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[fetchAgendaCategories]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}]{#fetchAgendaCategories-param-orgId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to create an agenda item.

**params**:

-   `orgId`: ID of organisation to fetch categories.

**returns**:

-   `Future<dynamic>`: Information about the created agenda item.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<dynamic> fetchAgendaCategories(String orgId) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
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
4.  fetchAgendaCategories method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
