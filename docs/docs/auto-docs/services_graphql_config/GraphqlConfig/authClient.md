:::::: {#dartdoc-main-content .main-content above-sidebar="services_graphql_config/GraphqlConfig-class-sidebar.html" below-sidebar=""}
<div>

# [authClient]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]{.returntype}
[authClient]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
GraphQLClient authClient() {
  final AuthLink authLink = AuthLink(getToken: () async => 'Bearer $token');
  final Link finalAuthLink = authLink.concat(httpLink);
  return GraphQLClient(
    cache: GraphQLCache(partialDataPolicy: PartialDataCachePolicy.accept),
    link: finalAuthLink,
  );
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  authClient method

##### GraphqlConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
