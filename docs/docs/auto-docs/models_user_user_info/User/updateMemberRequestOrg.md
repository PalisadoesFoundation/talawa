::::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [updateMemberRequestOrg]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [updateMemberRequestOrg]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [orgList]{.parameter-name}]{#updateMemberRequestOrg-param-orgList
    .parameter}

)
:::

::: {.section .desc .markdown}
Method to update membershipRequests List.

**params**:

-   `orgList`: List of organisations user have sent membership request.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void updateMemberRequestOrg(List<OrgInfo> orgList) {
  this.membershipRequests = [...membershipRequests!, ...orgList];
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
4.  updateMemberRequestOrg method

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
