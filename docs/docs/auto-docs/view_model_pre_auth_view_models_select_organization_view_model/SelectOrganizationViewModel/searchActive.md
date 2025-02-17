::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [searchActive]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [searchActive]{.name}()
:::

::: {.section .desc .markdown}
if search is enabled.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void searchActive() {
  if (searchFocus.hasFocus) {
    organizations = [];
    searching = true;
    setState(ViewState.idle);
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4.  searchActive method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
