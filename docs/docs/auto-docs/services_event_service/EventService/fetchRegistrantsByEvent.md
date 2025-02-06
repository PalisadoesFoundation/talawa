


# fetchRegistrantsByEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) fetchRegistrantsByEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)





<p>This function is used to fetch all registrants of an event.</p>
<p><strong>params</strong>:</p>
<ul>
<li>```darteventId```: id of an event.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li>```dartFuture&lt;dynamic&gt;```: Information about event registrants.</li>
</ul>



## Implementation

```dart
Future<dynamic> fetchRegistrantsByEvent(String eventId) async \{
  await _dbFunctions.refreshAccessToken(userConfig.currentUser.refreshToken!);
  final result = await _dbFunctions.gqlAuthQuery(
    EventQueries().registrantsByEvent(eventId),
  );
  return result;
\}
```







