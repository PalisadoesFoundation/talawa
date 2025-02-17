::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getCurrentOrgUsersList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getCurrentOrgUsersList]{.name}()
:::

::: {.section .desc .markdown}
function to get all users of current organization.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await _organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
    notifyListeners();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_contact_view_model](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
4.  getCurrentOrgUsersList method

##### SelectContactViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
