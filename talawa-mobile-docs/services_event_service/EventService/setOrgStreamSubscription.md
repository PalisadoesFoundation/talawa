


# setOrgStreamSubscription method








void setOrgStreamSubscription
()





<p>This function is used to set stream subscription for an organization.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void setOrgStreamSubscription() {
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    _currentOrg = updatedOrganization;
  });
}
```







