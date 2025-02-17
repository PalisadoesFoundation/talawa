::::::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [addVolunteerToGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[addVolunteerToGroup]{.name}()
:::

::: {.section .desc .markdown}
Creates a GraphQL mutation for adding a volunteer to a group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to add a volunteer to a
    group.

This function generates a GraphQL mutation string for adding a volunteer
to a group.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String addVolunteerToGroup() {
  return '''
  mutation CreateEventVolunteer(\$data: EventVolunteerInput!) {
    createEventVolunteer(data: \$data) {
      _id
      isAssigned
      response
      creator{
      _id
      }
      group{
      _id
      name
      }
      isInvited
      user{
      _id
      firstName
      lastName
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
4.  addVolunteerToGroup method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
