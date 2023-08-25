


# initialise method








void initialise
()





<p>This function is usedto do initialisation of stuff in the view model.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void initialise() {
  _currentUser = locator<UserConfig>().currentUser;
  _navigationService = locator<NavigationService>();
  _selectedOrg = locator<UserConfig>().currentOrg;
  _imageFile = null;
  _multiMediaPickerService = locator<MultiMediaPickerService>();
  _dbFunctions = locator<DataBaseMutationFunctions>();
}
```







