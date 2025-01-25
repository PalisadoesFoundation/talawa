::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/user_config.dart](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateUserCreatedOrg method

::: self-name
updateUserCreatedOrg
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [updateUserCreatedOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateUserCreatedOrg]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [orgDetails]{.parameter-name}]{#updateUserCreatedOrg-param-orgDetails
    .parameter}

)
:::

::: {.section .desc .markdown}
Updates the user created organization.

**params**:

-   `orgDetails`: details of the organization that user joined.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
  _currentUser!.updateCreatedOrg(orgDetails);
  saveUserInHive();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  updateUserCreatedOrg method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
