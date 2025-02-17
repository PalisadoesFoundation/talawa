::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [updateAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[updateAgendaItem]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for updating an agenda item.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to update an agenda
    item.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String updateAgendaItem() {
  return """
  mutation UpdateAgendaItem(\$updateAgendaItemId: ID!
  \$input: UpdateAgendaItemInput!
) {
    updateAgendaItem(id: \$updateAgendaItemId, input: \$input) {
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
4.  updateAgendaItem method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
