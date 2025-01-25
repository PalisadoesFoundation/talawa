::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  removeVolunteerMutation method

::: self-name
removeVolunteerMutation
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [removeVolunteerMutation]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[removeVolunteerMutation]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for deleting a volunteer from a group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to delete a volunteer to
    a group.

This function generates a GraphQL mutation string for deleting a
volunteer to a group.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String removeVolunteerMutation() {
  return '''
mutation RemoveEventVolunteer(\$id: ID!) {
  removeEventVolunteer(id: \$id) {
    _id
  }
}
''';
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
4.  removeVolunteerMutation method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
