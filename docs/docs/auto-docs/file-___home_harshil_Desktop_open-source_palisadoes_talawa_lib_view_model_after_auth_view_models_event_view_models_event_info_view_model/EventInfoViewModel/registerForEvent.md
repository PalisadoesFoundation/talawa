




registerForEvent method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. registerForEvent method

registerForEvent


dark\_mode

light\_mode




# registerForEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
registerForEvent()

The function allows user to register for an event.

**params**:
None

**returns**:
None


## Implementation

```
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
    fabTitle = getFabTitle();
    navigationService.pop();
    notifyListeners();
    await locator<EventService>().getEvents();
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3. [EventInfoViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. registerForEvent method

##### EventInfoViewModel class





talawa
1.0.0+1






