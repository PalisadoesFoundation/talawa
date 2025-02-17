::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [isPresentinSwitchableOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[isPresentinSwitchableOrg]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
    [switchToOrg]{.parameter-name}]{#isPresentinSwitchableOrg-param-switchToOrg
    .parameter}

)
:::

::: {.section .desc .markdown}
This function checks `switchOrg` is present in the `switchAbleOrg`.

**params**:

-   `switchToOrg`: `OrgInfo` type of organization want to switch into.

**returns**:

-   `bool`: returns true if switchToOrg is in switchAbleOrg list.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
  var isPresent = false;
  for (final OrgInfo orgs in switchAbleOrg) {
    if (orgs.id == switchToOrg.id) {
      isPresent = true;
    }
  }
  return isPresent;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4.  isPresentinSwitchableOrg method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
