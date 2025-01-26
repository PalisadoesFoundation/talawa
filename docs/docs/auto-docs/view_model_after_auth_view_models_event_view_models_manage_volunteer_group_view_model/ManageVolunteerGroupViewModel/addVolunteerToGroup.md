::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  addVolunteerToGroup method

::: self-name
addVolunteerToGroup
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [addVolunteerToGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[addVolunteerToGroup]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [volunteerId]{.parameter-name},
    ]{#addVolunteerToGroup-param-volunteerId .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}, ]{#addVolunteerToGroup-param-eventId
    .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [groupId]{.parameter-name}]{#addVolunteerToGroup-param-groupId
    .parameter}

)
:::

::: {.section .desc .markdown}
Adds a volunteer to the specified group.

**params**:

-   `volunteerId`: The ID of the volunteer to add.
-   `eventId`: The ID of the event.
-   `groupId`: The ID of the group.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> addVolunteerToGroup(
  String volunteerId,
  String eventId,
  String groupId,
) async {
  try {
    final variables = {
      'eventId': eventId,
      'userId': volunteerId,
      'groupId': groupId,
    };
    final result = await locator<EventService>()
        .addVolunteerToGroup(variables) as QueryResult;
    final data = result.data!;
    final addedVolunteerData =
        data['createEventVolunteer'] as Map<String, dynamic>;
    final addedVolunteer = EventVolunteer.fromJson(addedVolunteerData);
    _volunteers.add(addedVolunteer);
    notifyListeners();
  } catch (e) {
    print('Error adding volunteer to group: $e');
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  addVolunteerToGroup method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
