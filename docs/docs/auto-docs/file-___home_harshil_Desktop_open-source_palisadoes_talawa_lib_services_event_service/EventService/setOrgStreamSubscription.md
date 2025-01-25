




setOrgStreamSubscription method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. setOrgStreamSubscription method

setOrgStreamSubscription


dark\_mode

light\_mode




# setOrgStreamSubscription method


void
setOrgStreamSubscription()

This function is used to set stream subscription for an organization.

**params**:
None

**returns**:
None


## Implementation

```
void setOrgStreamSubscription() {
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    _currentOrg = updatedOrganization;
  });
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. setOrgStreamSubscription method

##### EventService class





talawa
1.0.0+1






