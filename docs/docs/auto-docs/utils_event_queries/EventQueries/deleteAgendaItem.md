::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [deleteAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[deleteAgendaItem]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for deleting an agenda item.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to delete an agenda
    item.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String deleteAgendaItem() {
  return """
  mutation RemoveAgendaItem(\$removeAgendaItemId: ID!) {
    removeAgendaItem(id: \$removeAgendaItemId) {
       _id
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
4.  deleteAgendaItem method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
