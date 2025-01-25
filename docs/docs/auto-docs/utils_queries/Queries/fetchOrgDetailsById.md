::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/queries.dart](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchOrgDetailsById method

::: self-name
fetchOrgDetailsById
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchOrgDetailsById]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[fetchOrgDetailsById]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}]{#fetchOrgDetailsById-param-orgId
    .parameter}

)
:::

::: {.section .desc .markdown}
query to fetch org details.

**params**:

-   `orgId`: org identifier

**returns**:

-   `String`: query in string form, to be passed on to graphql client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchOrgDetailsById(String orgId) {
  return '''
  query{
    organizations(id: "$orgId"){
      image
      _id
      name
      admins{
        _id
      }
      description
      userRegistrationRequired
      creator{
        _id
        firstName
        lastName
      }
      members{
        _id
        firstName
        lastName
        image
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
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchOrgDetailsById method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
