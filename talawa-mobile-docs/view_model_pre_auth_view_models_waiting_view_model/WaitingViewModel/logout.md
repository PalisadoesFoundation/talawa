


# logout method








void logout
()





<p>This function ends the session for the user or logout the user from the application.</p>



## Implementation

```dart
void logout() {
  final user = Hive.box<User>('currentUser');
  final url = Hive.box('url');
  user.clear();
  url.clear();
  navigationService.removeAllAndPush(
    Routes.languageSelectionRoute,
    Routes.splashScreen,
    arguments: '0',
  );
}
```







