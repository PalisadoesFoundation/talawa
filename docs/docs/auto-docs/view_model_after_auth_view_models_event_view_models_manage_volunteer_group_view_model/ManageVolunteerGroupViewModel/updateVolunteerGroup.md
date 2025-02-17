::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updateVolunteerGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateVolunteerGroup]{.name}(

1.  [[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]{.type-annotation}
    [group]{.parameter-name}, ]{#updateVolunteerGroup-param-group
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}, ]{#updateVolunteerGroup-param-eventId
    .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [name]{.parameter-name}, ]{#updateVolunteerGroup-param-name
    .parameter}
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [volunteersRequired]{.parameter-name},
    ]{#updateVolunteerGroup-param-volunteersRequired .parameter}

)
:::

::: {.section .desc .markdown}
Updates the details of a volunteer group.

**params**:

-   `group`: The volunteer group to update.
-   `eventId`: The ID of the event.
-   `name`: The new name for the group.
-   `volunteersRequired`: The new number of volunteers required.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> updateVolunteerGroup(
  EventVolunteerGroup group,
  String eventId,
  String name,
  int volunteersRequired,
) async {
  final variables = {
    'id': group.id,
    'data': {
      'eventId': eventId,
      'name': name,
      'volunteersRequired': volunteersRequired,
    },
  };

  try {
    final result = await locator<EventService>()
        .updateVolunteerGroup(variables) as QueryResult;

    if (result.data != null) {
      group.name = name;
      group.volunteersRequired = volunteersRequired;
      notifyListeners();
    }
  } catch (e) {
    print('Error updating volunteer group: $e');
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
4.  updateVolunteerGroup method

##### ManageVolunteerGroupViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
