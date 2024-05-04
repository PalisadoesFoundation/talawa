


# deleteEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) deleteEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function is used to delete the event.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>eventId</code>: id of an event</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;dynamic&gt;</code>: Information about the event deletion</li>
</ul>



## Implementation

```dart
Future<dynamic> deleteEvent(String eventId) async {
  navigationService.pushDialog(
    const CustomProgressDialog(key: Key('DeleteEventProgress')),
  );
  final tokenResult = await _dbFunctions
      .refreshAccessToken(userConfig.currentUser.refreshToken!);
  debugPrint(tokenResult.toString());
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().deleteEvent(eventId),
  );
  navigationService.pop();
  return result;
}
```







