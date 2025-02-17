::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [deleteVolunteerGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[deleteVolunteerGroup]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [groupId]{.parameter-name}]{#deleteVolunteerGroup-param-groupId
    .parameter}

)
:::

::: {.section .desc .markdown}
Deletes a volunteer group.

**params**:

-   `groupId`: The ID of the group to delete.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> deleteVolunteerGroup(String groupId) async {
  try {
    final variables = {
      'id': groupId,
    };
    final result = await locator<EventService>()
        .removeVolunteerGroup(variables) as QueryResult;
    final data = result.data;

    if (data != null && data['removeEventVolunteerGroup'] != null) {
      notifyListeners();
    }
  } catch (e) {
    print('Error deleting volunteer group: $e');
  }
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
4.  deleteVolunteerGroup method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
