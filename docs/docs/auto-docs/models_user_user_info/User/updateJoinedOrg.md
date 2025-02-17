::::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [updateJoinedOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [updateJoinedOrg]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [orgList]{.parameter-name}]{#updateJoinedOrg-param-orgList
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to updated joinedOrganisation list.

**params**:

-   `orgList`: List of organsaitions user has joined.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void updateJoinedOrg(List<OrgInfo> orgList) {
  this.joinedOrganizations = orgList;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  updateJoinedOrg method

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
