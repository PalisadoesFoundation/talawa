::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
4.  getCurrentOrgUsersList method

::: self-name
getCurrentOrgUsersList
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class-sidebar.html" below-sidebar=""}
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
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [select_contact_view_model](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  [SelectContactViewModel](../../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
4.  getCurrentOrgUsersList method

##### SelectContactViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
