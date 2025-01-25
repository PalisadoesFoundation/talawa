




getEvents method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. getEvents method

getEvents


dark\_mode

light\_mode




# getEvents method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getEvents()

This function is used to fetch all the events of an organization.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> getEvents() async {
  final List<Event> newEvents = await getNewFeedAndRefreshCache();
  _eventStreamController.add(newEvents);
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. getEvents method

##### EventService class





talawa
1.0.0+1






