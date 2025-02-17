::::::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html" below-sidebar=""}
<div>

# [refreshAccessToken]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[refreshAccessToken]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [refreshToken]{.parameter-name}]{#refreshAccessToken-param-refreshToken
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to refresh the Authenication token to access the
application.

**params**:

-   `refreshToken`: Needed for authentication

**returns**:

-   `Future<bool>`: it returns Future of dynamic
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> refreshAccessToken(String refreshToken) async {
  // run the graphQL mutation
  final QueryResult result = await clientNonAuth.mutate(
    MutationOptions(
      document: gql(
        _query.refreshToken(refreshToken),
      ),
    ),
  );
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = GraphqlExceptionResolver.encounteredExceptionOrError(
      result.exception!,
    );
    if (exception!) {
      refreshAccessToken(refreshToken);
    } else {
      navigationService.pop();
    }
  } else if (result.data != null && result.isConcrete) {
    userConfig.updateAccessToken(
      refreshToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['refreshToken']
          .toString(),
      accessToken: (result.data!['refreshToken']
              as Map<String, dynamic>)['accessToken']
          .toString(),
    );
    databaseFunctions.init();
    return true;
  }
  return false;
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
4.  refreshAccessToken method

##### DataBaseMutationFunctions class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
