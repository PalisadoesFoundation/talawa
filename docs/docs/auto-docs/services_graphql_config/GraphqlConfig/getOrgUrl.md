::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/graphql_config.dart](../../services_graphql_config/)
3.  [GraphqlConfig](../../services_graphql_config/GraphqlConfig-class.html)
4.  getOrgUrl method

::: self-name
getOrgUrl
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_graphql_config/GraphqlConfig-class-sidebar.html" below-sidebar=""}
<div>

# [getOrgUrl]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [getOrgUrl]{.name}()
:::

::: {.section .desc .markdown}
This function is used to get the organization URL.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void getOrgUrl() {
  final box = Hive.box('url');
  final String? url = box.get(urlKey) as String?;
  final String? imgUrl = box.get(imageUrlKey) as String?;
  orgURI = url ?? ' ';
  displayImgRoute = imgUrl ?? ' ';
  httpLink = HttpLink(orgURI!);
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
4.  getOrgUrl method

##### GraphqlConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
