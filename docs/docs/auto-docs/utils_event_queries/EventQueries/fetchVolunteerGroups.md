::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchVolunteerGroups method

::: self-name
fetchVolunteerGroups
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_event_queries/EventQueries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchVolunteerGroups]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchVolunteerGroups]{.name}()
:::

::: {.section .desc .markdown}
Fetches event volunteer groups based on criteria such as event ID.

**params**: None

**returns**:

-   `String`: Returns a GraphQL query string to fetch event volunteer
    groups that match the provided criteria.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchVolunteerGroups() {
  return '''
    query GetEventVolunteerGroups(\$where: EventVolunteerGroupWhereInput) {
      getEventVolunteerGroups(where: \$where) {
        _id
        name
        volunteersRequired
        createdAt
        volunteers{
        _id
        response
        user{
        _id
        firstName
        lastName
        }
        }
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
4.  fetchVolunteerGroups method

##### EventQueries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
