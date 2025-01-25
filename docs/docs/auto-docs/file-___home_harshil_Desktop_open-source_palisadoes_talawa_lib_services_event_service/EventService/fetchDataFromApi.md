




fetchDataFromApi method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchDataFromApi method

fetchDataFromApi


dark\_mode

light\_mode




# fetchDataFromApi method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
fetchDataFromApi()

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchDataFromApi method

##### EventService class





talawa
1.0.0+1






