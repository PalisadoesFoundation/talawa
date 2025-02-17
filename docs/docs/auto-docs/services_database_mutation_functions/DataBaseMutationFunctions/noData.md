:::::::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html" below-sidebar=""}
<div>

# [noData]{.kind-property} property

</div>

:::: {.section .multi-line-signature}
[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}
[noData]{.name}

::: features
[getter/setter pair]{.feature}
:::
::::

::: {.section .desc .markdown}
when result has no data and null.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
QueryResult noData = QueryResult(
  options: QueryOptions(
    document: gql(
      PostQueries().addLike(),
    ),
  ),
  data: null,
  source: QueryResultSource.network,
);
```
:::
::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  noData property

##### DataBaseMutationFunctions class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
