


# deleteEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> deleteEvent
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId})





<p>This function deletes the event.</p>
<p>params:</p>
<ul>
<li><code>eventId</code> : id of the event that need to be delete.</li>
</ul>



## Implementation

```dart
Future<void> deleteEvent({required String eventId}) async {
  // push the custom alert dialog to ask for confirmation.
  navigationService.pushDialog(
    CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to delete this event?',
      successText: 'Delete',
      success: () {
        navigationService.pop();
        _eventService.deleteEvent(eventId).then(
          (result) async {
            if (result != null) {
              navigationService.pop();
              setState(ViewState.busy);
              print(result);
              _uniqueEventIds.remove(eventId);
              _events.removeWhere((element) => element.id == eventId);
              await Future.delayed(const Duration(milliseconds: 500));
              setState(ViewState.idle);
            }
          },
        );
      },
    ),
  );
}
```







