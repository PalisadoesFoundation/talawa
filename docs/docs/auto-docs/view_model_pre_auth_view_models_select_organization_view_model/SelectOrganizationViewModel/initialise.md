::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialise]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [initialData]{.parameter-name}]{#initialise-param-initialData
    .parameter}

)
:::

::: {.section .desc .markdown}
initializer.

**params**:

-   `initialData`: data

**returns**:

-   `Future<void>`: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialise(String initialData) async {
  searchFocus.addListener(searchActive);
  if (!initialData.contains('-1')) {
    databaseFunctions.init();
    final fetch = await databaseFunctions.fetchOrgById(initialData);
    if (fetch.runtimeType == OrgInfo) {
      selectedOrganization = fetch as OrgInfo;
      if (userConfig.currentUser.refreshToken?.isEmpty ?? true) {
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: selectedOrganization,
        );
      } else {
        selectOrg(selectedOrganization);
      }
      setState(ViewState.idle);
    }
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
4.  initialise method

##### SelectOrganizationViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
