


# initialise method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialise
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) initialData)








## Implementation

```dart
Future<void> initialise(String initialData) async {
  searchFocus.addListener(searchActive);
  if (!initialData.contains('-1')) {
    databaseFunctions.init();
    final fetch = await databaseFunctions.fetchOrgById(initialData);
    if (fetch.runtimeType == OrgInfo) {
      selectedOrganization = fetch as OrgInfo;
      if (userConfig.currentUser.refreshToken?.isEmpty ?? true) {
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: selectedOrganization,
        );
      } else {
        selectOrg(selectedOrganization);
      }
      setState(ViewState.idle);
    }
  }
}
```







