::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/database_mutation_functions.dart](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  initClientNonAuth method

::: self-name
initClientNonAuth
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html" below-sidebar=""}
<div>

# [initClientNonAuth]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initClientNonAuth]{.name}()
:::

::: {.section .desc .markdown}
Initializes
[clientNonAuth](../../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html)
function.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initClientNonAuth() {
  graphqlConfig.getOrgUrl();
  clientNonAuth = graphqlConfig.clientToQuery();
  _query = Queries();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [database_mutation_functions](../../services_database_mutation_functions/)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.html)
4.  initClientNonAuth method

##### DataBaseMutationFunctions class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
