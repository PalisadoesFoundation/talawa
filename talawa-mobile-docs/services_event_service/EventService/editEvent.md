


# editEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> editEvent
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId, required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables})





<p>This function is used to edit an event.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>eventId</code>: id of an event</li>
<li><code>variables</code>: this will be <code>map</code> type and contain all the event details need to be update.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: void return</li>
</ul>



## Implementation

```dart
Future<void> editEvent({
  required String eventId,
  required Map<String, dynamic> variables,
}) async {
  navigationService.pushDialog(
    const CustomProgressDialog(
      key: Key('EditEventProgress'),
    ),
  );
  final tokenResult = await _dbFunctions
      .refreshAccessToken(userConfig.currentUser.refreshToken!);
  debugPrint(tokenResult.toString());
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateEvent(eventId: eventId),
    variables: variables,
  );
  navigationService.pop();
  if (result != null) {
    navigationService.removeAllAndPush(
      Routes.exploreEventsScreen,
      Routes.mainScreen,
      arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
    );
  }
}
```







