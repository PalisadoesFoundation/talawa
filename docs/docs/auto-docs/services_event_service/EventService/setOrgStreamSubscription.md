
<div>

# setOrgStreamSubscription method

</div>


void 



This function is used to set stream subscription for an organization.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    _currentOrg = updatedOrganization;
  });
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  setOrgStreamSubscription method

##### EventService class







