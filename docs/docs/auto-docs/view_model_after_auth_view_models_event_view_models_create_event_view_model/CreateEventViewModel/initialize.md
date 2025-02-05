


# initialize method








void initialize
()





<p>Function To Initialize.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void initialize() {
  _currentOrg = _userConfig.currentOrg;
  //_organizationService = locator<OrganizationService>();

  _imageFile = null;
  _multiMediaPickerService = locator<MultiMediaPickerService>();
}
```







