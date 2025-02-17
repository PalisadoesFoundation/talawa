:::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchJoinInOrg]{.kind-property} property

</div>

:::::: {#getter .section}
::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
get [fetchJoinInOrg]{.name}
:::

::: {.section .desc .markdown}
getter for joined org.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String get fetchJoinInOrg {
  return """
  query organizationsConnection(\$first: Int, \$skip: Int){
    organizationsConnection(
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
      image
      _id
      name
      image
      description
      address{
      city
      countryCode
      state
    }
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
      members{
            firstName
            lastName
            image
            }
            admins{
            firstName
            lastName
            image
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
4.  fetchJoinInOrg property

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
