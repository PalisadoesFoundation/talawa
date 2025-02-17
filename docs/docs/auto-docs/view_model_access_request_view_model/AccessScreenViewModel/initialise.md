::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_access_request_view_model/AccessScreenViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialise]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]{.type-annotation}
    [org]{.parameter-name}]{#initialise-param-org .parameter}

)
:::

::: {.section .desc .markdown}
Initialization function.

**params**:

-   `org`: Org to send request to.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialise(OrgInfo org) async {
  selectedOrganization = org;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [access_request_view_model](../../view_model_access_request_view_model/)
3.  [AccessScreenViewModel](../../view_model_access_request_view_model/AccessScreenViewModel-class.html)
4.  initialise method

##### AccessScreenViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
