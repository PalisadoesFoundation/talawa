::::::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html" below-sidebar=""}
<div>

# [gqlAuthQuery]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[gqlAuthQuery]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [query]{.parameter-name}, {]{#gqlAuthQuery-param-query .parameter}
2.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [variables]{.parameter-name}, ]{#gqlAuthQuery-param-variables
    .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to run the graph-ql query for authentication.

**params**:

-   `query`: query is used to fetch data in graphql, for more info read
    graphql docs
-   `variables`: variables to be passed with query

**returns**:

-   `Future<QueryResult<Object?>>`: it returns Future of dynamic
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> gqlAuthQuery(
  String query, {
  Map<String, dynamic>? variables,
}) async {
  final QueryOptions options = QueryOptions(
    document: gql(query),
    variables: variables ?? <String, dynamic>{},
    fetchPolicy: FetchPolicy.networkOnly,
  );
  final response = await cacheService.executeOrCacheOperation(
    operation: query,
    variables: variables,
    operationType: CachedOperationType.gqlAuthQuery,
    whenOnline: () async {
      final QueryResult result = await clientAuth.query(options);
      // if there is an error or exception in [result]
      if (result.hasException) {
        final exception =
            GraphqlExceptionResolver.encounteredExceptionOrError(
          result.exception!,
        );
        if (exception!) {
          return await gqlAuthQuery(query, variables: variables);
        }
      } else if (result.data != null && result.isConcrete) {
        // coverage:ignore-start
        traverseAndConvertDates(
          result.data ?? <String, dynamic>{},
          convertUTCToLocal,
          splitDateTimeLocal,
        );
        // coverage:ignore-end
        return result;
      }
      return noData;
    },
  );
  return response;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  gqlAuthQuery method

##### DataBaseMutationFunctions class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
