::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getCurrentOrgUsersList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getCurrentOrgUsersList]{.name}()
:::

::: {.section .desc .markdown}
Fetches the list of current organization members.

**params**: None

**returns**:

-   `Future<List<User>>`: A list of organization members.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<User>> getCurrentOrgUsersList() async {
  if (orgMembersList.isEmpty) {
    orgMembersList = await organizationService
        .getOrgMembersList(userConfig.currentOrg.id!);
  }
  final availableMembers = orgMembersList.where((member) {
    return !volunteers.any((volunteer) => volunteer.user!.id == member.id);
  }).toList();

  for (final member in availableMembers) {
    _memberCheckedMap.putIfAbsent(member.id!, () => false);
  }

  return availableMembers;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  getCurrentOrgUsersList method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
