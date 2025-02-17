::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [addEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[addEvent]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for adding an event.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to create an event.

This function generates a GraphQL mutation string for creating an event.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String addEvent() {
  return """
  mutation Mutation(\$data: EventInput!, \$recurrenceRuleData: RecurrenceRuleInput) {
    createEvent(data: \$data, recurrenceRuleData: \$recurrenceRuleData) {
      _id
      title
      description
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
4.  addEvent method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
