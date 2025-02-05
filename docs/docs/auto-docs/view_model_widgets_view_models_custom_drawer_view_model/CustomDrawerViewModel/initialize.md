


# initialize method








void initialize
([MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md) homeModel, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)








## Implementation

```dart
void initialize(MainScreenViewModel homeModel, BuildContext context) {
  _currentOrganizationStreamSubscription =
      userConfig.currentOrgInfoStream.listen(
    (updatedOrganization) {
      setSelectedOrganizationName(updatedOrganization);
    },
  );
  _currentUser = userConfig.currentUser;
  _selectedOrg = userConfig.currentOrg;
  _switchAbleOrg = _currentUser.joinedOrganizations!;
}
```







