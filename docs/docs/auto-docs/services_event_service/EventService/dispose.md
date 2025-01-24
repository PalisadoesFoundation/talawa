




dispose method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. dispose method

dispose


dark\_mode

light\_mode




# dispose method


void
dispose()

This function is used to cancel the stream subscription of an organization.

**params**:
None

**returns**:
None


## Implementation

```
void dispose() {
  _currentOrganizationStreamSubscription.cancel();
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. dispose method

##### EventService class





talawa
1.0.0+1






