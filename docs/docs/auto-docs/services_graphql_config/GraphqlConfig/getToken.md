::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/graphql_config.dart](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  getToken method

::: self-name
getToken
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_graphql_config/GraphqlConfig-class-sidebar.html" below-sidebar=""}
<div>

# [getToken]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype}
[getToken]{.name}()
:::

::: {.section .desc .markdown}
This function is used to get user the access token.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future getToken() async {
  final authToken = userConfig.currentUser.authToken;
  token = authToken;
  getOrgUrl();
  return true;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  getToken method

##### GraphqlConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
