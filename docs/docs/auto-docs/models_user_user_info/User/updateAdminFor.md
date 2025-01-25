::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/user/user_info.dart](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  updateAdminFor method

::: self-name
updateAdminFor
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [updateAdminFor]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [updateAdminFor]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [orgList]{.parameter-name}]{#updateAdminFor-param-orgList
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to update adminFor List.

**params**:

-   `orgList`: List of organisations user is admin of.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void updateAdminFor(List<OrgInfo> orgList) {
  this.adminFor = orgList;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  updateAdminFor method

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
