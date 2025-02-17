::::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [fetchDataFromApi]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[fetchDataFromApi]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Abstract method to be implemented by subclasses to fetch data from an
API.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of data fetched from
    the API.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Future<List<Event>> fetchDataFromApi() async {
  // get current organization id
  final String currentOrgID = _currentOrg.id!;
  // mutation to fetch the events
  final String mutation = EventQueries().fetchOrgEvents(currentOrgID);
  final result = await _dbFunctions.gqlAuthQuery(mutation);

  if (result.data == null) {
    throw Exception('unable to fetch data');
  }

  final eventsJson =
      result.data!["eventsByOrganizationConnection"] as List<dynamic>;
  eventsJson.forEach((eventJsonData) {
    final Event event = Event.fromJson(eventJsonData as Map<String, dynamic>);
    event.isRegistered = event.attendees?.any(
          (attendee) => attendee.id == _userConfig.currentUser.id,
        ) ??
        false;
    _events.insert(0, event);
  });
  return _events;
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchDataFromApi method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
