::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/caching/cached_user_action.dart](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  execute method

::: self-name
execute
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html" below-sidebar=""}
<div>

# [execute]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[execute]{.name}()
:::

::: {.section .desc .markdown}
Executes the cached user action based on its operation type.

**params**: None

**returns**:

-   `Future<QueryResult<Object?>>`: result.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> execute() async {
  switch (operationType) {
    case CachedOperationType.gqlAuthQuery:
      return await databaseFunctions.gqlAuthQuery(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlAuthMutation:
      return await databaseFunctions.gqlAuthMutation(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlNonAuthQuery:
      return await databaseFunctions.gqlNonAuthQuery(
        operation,
        variables: this.variables,
      );
    case CachedOperationType.gqlNonAuthMutation:
      return await databaseFunctions.gqlNonAuthMutation(
        operation,
        variables: this.variables,
      );
    default:
      return databaseFunctions.noData;
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  execute method

##### CachedUserAction class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
