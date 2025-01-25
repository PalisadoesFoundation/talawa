::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  createVolunteerGroup method

::: self-name
createVolunteerGroup
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [createVolunteerGroup]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[createVolunteerGroup]{.name}(

1.  [[[Event](../../models_events_event_model/Event-class.html)]{.type-annotation}
    [event]{.parameter-name}, ]{#createVolunteerGroup-param-event
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [groupName]{.parameter-name},
    ]{#createVolunteerGroup-param-groupName .parameter}
3.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation}
    [volunteersRequired]{.parameter-name}]{#createVolunteerGroup-param-volunteersRequired
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to create a new volunteer group for an event.

**params**:

-   `event`: Name of the group
-   `groupName`: Name of the group
-   `volunteersRequired`: Total number of volunteers required for the
    group

**returns**:

-   `Future<EventVolunteerGroup?>`: returns the new volunteer group for
    an event
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<EventVolunteerGroup?> createVolunteerGroup(
  Event event,
  String groupName,
  int volunteersRequired,
) async {
  try {
    final variables = {
      'eventId': event.id,
      'name': groupName,
      'volunteersRequired': volunteersRequired,
    };

    final result = await locator<EventService>()
        .createVolunteerGroup(variables) as QueryResult;

    if (result.data == null ||
        result.data!['createEventVolunteerGroup'] == null) {
      throw Exception('Failed to create volunteer group or no data returned');
    }

    final data = result.data!['createEventVolunteerGroup'];
    final newGroup =
        EventVolunteerGroup.fromJson(data as Map<String, dynamic>);

    _volunteerGroups.add(newGroup);
    notifyListeners();

    return newGroup;
  } catch (e) {
    print('Error creating volunteer group: $e');
  }
  return null;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  createVolunteerGroup method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
