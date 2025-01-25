::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchVolunteerGroupsByEvent method

::: self-name
fetchVolunteerGroupsByEvent
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchVolunteerGroupsByEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[fetchVolunteerGroupsByEvent]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [eventId]{.parameter-name}]{#fetchVolunteerGroupsByEvent-param-eventId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to fetch all volunteer groups for an event.

**params**:

-   `eventId`: Id of the event to fetch volunteer groups.

**returns**:

-   `Future<List<EventVolunteerGroup>>`: returns the list of volunteer
    groups
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<EventVolunteerGroup>> fetchVolunteerGroupsByEvent(
  String eventId,
) async {
  try {
    final variables = {
      "where": {"eventId": eventId},
    };
    final result = await _dbFunctions.gqlAuthQuery(
      EventQueries().fetchVolunteerGroups(),
      variables: variables,
    );
    final List groupsJson = result.data!['getEventVolunteerGroups'] as List;

    return groupsJson
        .map(
          (groupJson) =>
              EventVolunteerGroup.fromJson(groupJson as Map<String, dynamic>),
        )
        .toList();
  } catch (e) {
    print('Error fetching volunteer groups: $e');
    rethrow;
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchVolunteerGroupsByEvent method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
