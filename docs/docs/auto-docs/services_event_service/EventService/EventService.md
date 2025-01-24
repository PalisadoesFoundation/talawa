




EventService constructor - EventService - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. EventService constructor

EventService


dark\_mode

light\_mode




# EventService constructor


EventService()

## Implementation

```
EventService() : super(HiveKeys.eventFeedKey) {
  _eventStream = _eventStreamController.stream.asBroadcastStream();
  print(_eventStream);
  _currentOrg = _userConfig.currentOrg;
  _userConfig.initialiseStream();
  setOrgStreamSubscription();
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. EventService constructor

##### EventService class





talawa
1.0.0+1






