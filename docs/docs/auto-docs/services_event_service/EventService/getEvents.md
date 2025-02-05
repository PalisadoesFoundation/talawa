


# getEvents method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getEvents
()





<p>This function is used to fetch all the events of an organization.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: void</li>
</ul>



## Implementation

```dart
Future<void> getEvents() async {
  // refresh user's access token
  await _dbFunctions.refreshAccessToken(userConfig.currentUser.refreshToken!);
  _dbFunctions.init();

  // get current organization id
  final String currentOrgID = _currentOrg.id!;
  // mutation to fetch the events
  final String mutation = EventQueries().fetchOrgEvents(currentOrgID);
  final result = await _dbFunctions.gqlAuthMutation(mutation);

  if (result == null) return;
  final List eventsJson = result.data!["eventsByOrganization"] as List;
  eventsJson.forEach((eventJsonData) {
    final Event event = Event.fromJson(eventJsonData as Map<String, dynamic>);
    event.isRegistered = event.registrants?.any(
          (registrant) => registrant.id == _userConfig.currentUser.id,
        ) ??
        false;
    _eventStreamController.add(event);
  });
}
```







