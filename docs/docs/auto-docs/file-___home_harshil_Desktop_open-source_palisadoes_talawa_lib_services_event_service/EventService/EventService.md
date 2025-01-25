




EventService constructor - EventService - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
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
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. EventService constructor

##### EventService class





talawa
1.0.0+1






