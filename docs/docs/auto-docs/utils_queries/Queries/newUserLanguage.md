::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/queries.dart](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  newUserLanguage method

::: self-name
newUserLanguage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [newUserLanguage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[newUserLanguage]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [userId]{.parameter-name}]{#newUserLanguage-param-userId .parameter}

)
:::

::: {.section .desc .markdown}
query for new user language .

**params**:

-   `userId`: user identifier

**returns**:

-   `String`: query in string form, to be passed on to graphql client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String newUserLanguage(String userId) {
  return '''
  query{
    userLanguage(userId:"$userId")
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
4.  newUserLanguage method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
