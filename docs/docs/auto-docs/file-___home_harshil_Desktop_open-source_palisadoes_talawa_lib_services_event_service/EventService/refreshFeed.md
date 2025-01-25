




refreshFeed method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. refreshFeed method

refreshFeed


dark\_mode

light\_mode




# refreshFeed method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
refreshFeed()

Refreshes the event feed by fetching the latest events from the API and updating the event stream.

This method retrieves the latest events using the `getNewFeedAndRefreshCache` method and adds the new events
to the event stream.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> refreshFeed() async {
  _events = await getNewFeedAndRefreshCache();
  _eventStreamController.add(_events);
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. refreshFeed method

##### EventService class





talawa
1.0.0+1






