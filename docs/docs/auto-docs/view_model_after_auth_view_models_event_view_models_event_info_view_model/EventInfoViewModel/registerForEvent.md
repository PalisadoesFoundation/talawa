


# registerForEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> registerForEvent
()





<p>This function helps the user to register for an event.</p>



## Implementation

```dart
Future<void> registerForEvent() async {
  // if event registration is open and user not already registered for the event.
  if (event.isRegisterable == true && event.isRegistered == false) {
    navigationService.pushDialog(
      const CustomProgressDialog(
        key: Key('RegisterEvent'),
      ),
    );

    // use `registerForAnEvent` function provided by `EventService` service.
    final registerResult =
        await locator<EventService>().registerForAnEvent(event.id!);
    //final registerResult = await EventService().registerForAnEvent(event.id!);
    // if the registration is successful.
    if (registerResult != null) {
      event.isRegistered = true;
      registrants.add(locator<UserConfig>().currentUser);
    }
    print(registerResult);
    fabTitle = getFabTitle();
    navigationService.pop();
    notifyListeners();
  }
}
```







