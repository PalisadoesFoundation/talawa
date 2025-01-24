




fetchEventsInitial method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. fetchEventsInitial method

fetchEventsInitial


dark\_mode

light\_mode




# fetchEventsInitial method


Future<void>
fetchEventsInitial()

Fetches the initial set of events, loading from the cache first, and then refreshing the feed.

This method loads events from the cache, adds them to the event stream, and then triggers a feed refresh
to fetch the latest events from the API and update the stream accordingly.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchEventsInitial() async {
  _events = await loadCachedData();
  _eventStreamController.add(_events);
  refreshFeed();
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. fetchEventsInitial method

##### EventService class





talawa
1.0.0+1






