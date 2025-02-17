::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [removeVolunteerFromGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[removeVolunteerFromGroup]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [volunteerId]{.parameter-name}]{#removeVolunteerFromGroup-param-volunteerId
    .parameter}

)
:::

::: {.section .desc .markdown}
Removes a volunteer from the group.

**params**:

-   `volunteerId`: The ID of the volunteer to remove.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> removeVolunteerFromGroup(String volunteerId) async {
  try {
    final variables = {
      'id': volunteerId,
    };
    final result = await locator<EventService>()
        .removeVolunteerFromGroup(variables) as QueryResult;
    final data = result.data;

    if (data != null && data['removeEventVolunteer'] != null) {
      _volunteers.removeWhere((volunteer) => volunteer.id == volunteerId);
      print('Volunteer removed successfully.');
      notifyListeners();
    } else {
      print('Failed to remove volunteer.');
    }
  } catch (e) {
    print('Error removing volunteer: $e');
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
4.  removeVolunteerFromGroup method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
