


# registerForAnEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) registerForAnEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function is used to register user for an event.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>eventId</code>: id of an event.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;dynamic&gt;</code>: Information about the event registration.</li>
</ul>



## Implementation

```dart
Future<dynamic> registerForAnEvent(String eventId) async {
  final tokenResult = await _dbFunctions
      .refreshAccessToken(userConfig.currentUser.refreshToken!);
  debugPrint(tokenResult.toString());
  final Map<String, dynamic> variables = {'eventId': eventId};
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().registerForEvent(),
    variables: variables,
  );
  return result;
}
```







