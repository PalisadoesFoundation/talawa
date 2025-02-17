
<div>

# fetchDataFromApi method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]\>]]\>]]



override




Abstract method to be implemented by subclasses to fetch data from an
API.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of data fetched from
    the API.



## Implementation

``` language-dart
@override
Future<List<Event>>  async {
  // get current organization id
  final String currentOrgID = _currentOrg.id!;
  // mutation to fetch the events
  final String mutation = .fetchOrgEvents(currentOrgID);
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







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchDataFromApi method

##### EventService class







