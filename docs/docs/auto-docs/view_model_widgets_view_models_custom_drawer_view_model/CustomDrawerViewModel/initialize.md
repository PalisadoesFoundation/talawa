::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}(

1.  [[[MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)]{.type-annotation}
    [homeModel]{.parameter-name}, ]{#initialize-param-homeModel
    .parameter}
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#initialize-param-context .parameter}

)
:::

::: {.section .desc .markdown}
initializer.

**params**:

-   `homeModel`: instance of MainScreenViewModel.
-   `context`: instance of BuildContext.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize(MainScreenViewModel homeModel, BuildContext context) {
  _currentOrganizationStreamSubscription =
      userConfig.currentOrgInfoStream.listen(
    (updatedOrganization) {
      setSelectedOrganizationName(updatedOrganization);
    },
  );
  _currentUser = userConfig.currentUser;
  _selectedOrg = userConfig.currentOrg;
  _switchAbleOrg = _currentUser.joinedOrganizations ?? [];
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
4.  initialize method

##### CustomDrawerViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
