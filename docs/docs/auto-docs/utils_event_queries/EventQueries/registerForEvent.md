::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [registerForEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[registerForEvent]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for registering for an event.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to register for the
    specified event.

This function generates a GraphQL mutation string for registering an
individual for an event.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String registerForEvent() {
  return """
   mutation registerForEvent(\$eventId: ID!) {
    registerForEvent(id: \$eventId) {
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
4.  registerForEvent method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
