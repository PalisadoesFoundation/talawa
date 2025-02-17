::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [refreshToken]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[refreshToken]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [refreshToken]{.parameter-name}]{#refreshToken-param-refreshToken
    .parameter}

)
:::

::: {.section .desc .markdown}
mutation for refresh token.

**params**:

-   `refreshToken`: related to auth, token based authentication,
    mutation to refresh the token

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String refreshToken(String refreshToken) {
  return '''
      mutation{
        refreshToken(refreshToken: "$refreshToken"){
          accessToken
          refreshToken
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
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  refreshToken method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
