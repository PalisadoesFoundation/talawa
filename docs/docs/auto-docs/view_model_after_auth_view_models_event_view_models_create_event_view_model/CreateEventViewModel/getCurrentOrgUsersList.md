::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getCurrentOrgUsersList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getCurrentOrgUsersList]{.name}()
:::

::: {.section .desc .markdown}
This function fetch all the users in the current organization and return
`List`.

**params**: None

**returns**:

-   `Future<List<User>>`: Current Organization Users List
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<User>> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }

  // loop through list
  orgMembersList.forEach((orgMember) {
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
  });
  // return list
  return orgMembersList;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  getCurrentOrgUsersList method

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
