::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [saveCurrentOrgInHive]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [saveCurrentOrgInHive]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
    [saveOrgAsCurrent]{.parameter-name}]{#saveCurrentOrgInHive-param-saveOrgAsCurrent
    .parameter}

)
:::

::: {.section .desc .markdown}
save current organization details in hive.

**params**:

-   `saveOrgAsCurrent`: instance of OrgInfo

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
  _currentOrg = saveOrgAsCurrent;
  _currentOrgInfoController.add(_currentOrg!);
  final box = Hive.box<OrgInfo>('currentOrg');
  if (box.get('org') == null) {
    box.put('org', _currentOrg!);
  } else {
    box.put('org', _currentOrg!);
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  saveCurrentOrgInHive method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
