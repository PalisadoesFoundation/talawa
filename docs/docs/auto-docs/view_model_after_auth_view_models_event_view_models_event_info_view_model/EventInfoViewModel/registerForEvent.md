
<div>

# registerForEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




The function allows user to register for an event.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
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
    if (registerResult != null) {
      event.isRegistered = true;
      final userConfig = locator<UserConfig>();
      attendees.add(
        Attendee(
          id: userConfig.currentUser.id,
          firstName: userConfig.currentUser.firstName,
          lastName: userConfig.currentUser.lastName,
          image: userConfig.currentUser.image,
        ),
      );
    }
    fabTitle = ;
    navigationService.;
    ;
    await locator<EventService>().;
  }
}
```







1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  registerForEvent method

##### EventInfoViewModel class







