




getEvents method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. getEvents method

getEvents


dark\_mode

light\_mode




# getEvents method


Future<void>
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
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. getEvents method

##### EventService class





talawa
1.0.0+1






