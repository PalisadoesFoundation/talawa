:::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchJoinInOrgByName]{.kind-property} property

</div>

:::::: {#getter .section}
::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
get [fetchJoinInOrgByName]{.name}
:::

::: {.section .desc .markdown}
getter for fetchJoinInOrgByName.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String get fetchJoinInOrgByName {
  return """
  query organizationsConnection(
    \$first: Int,
    \$skip: Int,
    \$nameStartsWith: String
  ){
    organizationsConnection(
      where:{
        name_starts_with: \$nameStartsWith,
        visibleInSearch: true,
        userRegistrationRequired: true,
      }
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
      image
      _id
      name
      image
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
    }
  }
""";
}
```
:::
::::::
::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchJoinInOrgByName property

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
